# Backend Ticket — Portfolio CMS API (NestJS)

| Field | Value |
|-------|--------|
| **Ticket ID** | `PORTFOLIO-BE-001` |
| **Title** | Build NestJS portfolio CMS backend (public site + admin APIs) |
| **Type** | Feature / Epic |
| **Priority** | High |
| **Consumer** | Flutter Web portfolio (public) + future Flutter/Web admin dashboard |
| **Stack** | NestJS + PostgreSQL (preferred) + JWT auth + file storage |
| **Out of scope** | Supabase, Firebase |

---

## Summary

Build a NestJS REST API that stores and serves all portfolio content for **Jwan Khalil**’s Flutter web site, and supports a future **admin dashboard** to create/update/delete that content without redeploying the frontend.

---

## Goals

1. **Public read APIs** for the live portfolio (no auth).
2. **Admin CRUD APIs** protected by authentication (for dashboard).
3. **File uploads** for avatar, project images, and resume PDF.
4. Stable JSON contract so Flutter can switch from local seed data to this API.

---

## Non-goals

- Social login / multi-tenant SaaS
- Real-time websockets (not required for v1)
- GraphQL (REST only for v1)

---

## Tech requirements

| Item | Requirement |
|------|-------------|
| Framework | NestJS (latest LTS-compatible) |
| DB | PostgreSQL |
| ORM | Prisma or TypeORM (team choice) |
| Auth | JWT (access + refresh preferred) |
| Validation | `class-validator` DTOs on all write endpoints |
| Docs | Swagger/OpenAPI at `/api/docs` |
| CORS | Allow Flutter web origin(s) — configurable via env |
| Config | `.env` for `DATABASE_URL`, `JWT_SECRET`, `CORS_ORIGINS`, storage keys |
| Response format | JSON, **snake_case** field names (see contract below) |
| IDs | UUID strings |
| Dates | ISO-8601 date strings (`YYYY-MM-DD` for dates; full ISO for timestamps) |
| Errors | Consistent shape: `{ "statusCode": number, "message": string \| string[], "error": string }` |

---

## Domain model

### 1. `profiles` (single owner profile — treat as one active row)

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| full_name | string | required |
| title | string | required |
| summary | text | required |
| email | string | required |
| phone | string \| null | |
| location | string \| null | |
| linkedin_url | string \| null | |
| github_url | string \| null | |
| avatar_url | string \| null | public URL |
| resume_url | string \| null | public URL |
| created_at | timestamptz | |
| updated_at | timestamptz | |

### 2. `experiences`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| company | string | required |
| role | string | required |
| employment_type | string \| null | e.g. Full-time, Contract |
| location | string \| null | |
| start_date | date | required |
| end_date | date \| null | null if current |
| is_current | boolean | default false |
| highlights | string[] | bullet points |
| sort_order | int | default 0, ascending |
| created_at / updated_at | timestamptz | |

### 3. `projects`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| title | string | required |
| description | text | required |
| github_url | string \| null | |
| live_url | string \| null | |
| image_url | string \| null | |
| tech_stack | string[] | |
| is_featured | boolean | default true |
| sort_order | int | |
| created_at / updated_at | timestamptz | |

### 4. `skills`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| category | string | e.g. State Management, UI |
| name | string | required |
| icon_key | string \| null | optional key for frontend icons |
| sort_order | int | |
| created_at | timestamptz | |

### 5. `educations`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| degree | string | required |
| institution | string | required |
| start_date | date \| null | |
| end_date | date \| null | |
| is_current | boolean | default false |
| sort_order | int | |
| created_at | timestamptz | |

### 6. `certifications`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| title | string | required |
| issuer | string | required |
| credential_url | string \| null | |
| sort_order | int | |
| created_at | timestamptz | |

### 7. `languages`

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| name | string | required |
| proficiency | string | required e.g. Native, B2 |
| sort_order | int | |
| created_at | timestamptz | |

### 8. `site_settings` (single active row)

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| site_title | string | |
| default_theme | enum | `light` \| `dark` \| `system` |
| accent_color | string \| null | hex optional |
| seo_description | string \| null | |
| updated_at | timestamptz | |

### 9. `admin_users` (for dashboard)

| Field | Type | Notes |
|-------|------|--------|
| id | uuid | PK |
| email | string | unique |
| password_hash | string | bcrypt/argon2 |
| role | enum | `admin` (v1 can be single role) |
| created_at | timestamptz | |

---

## API base

- Base path: `/api/v1`
- Swagger: `/api/docs`

---

## A) Public endpoints (no auth)

Used by Flutter portfolio website.

### `GET /api/v1/portfolio`

Returns the full site payload in one call (preferred by frontend).

**Response `200`:**

```json
{
  "profile": { "...": "Profile object" },
  "experiences": [],
  "projects": [],
  "skills": [],
  "educations": [],
  "certifications": [],
  "languages": [],
  "settings": { "...": "SiteSettings object" }
}
```

Lists must be ordered by `sort_order` ASC.  
Projects: return featured first or all ordered by `sort_order` (document choice; prefer all ordered by `sort_order`).

### Individual public reads (optional but recommended)

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/v1/profile` | Active profile |
| GET | `/api/v1/experiences` | Ordered list |
| GET | `/api/v1/projects` | Ordered list (`?featured=true` optional) |
| GET | `/api/v1/skills` | Ordered list |
| GET | `/api/v1/educations` | Ordered list |
| GET | `/api/v1/certifications` | Ordered list |
| GET | `/api/v1/languages` | Ordered list |
| GET | `/api/v1/settings` | Site settings |

### `POST /api/v1/contact` (optional v1.1)

Public contact form.

**Body:**

```json
{
  "name": "string",
  "email": "string",
  "message": "string"
}
```

**Behavior:** validate + store and/or email notify. Rate-limit this endpoint.

---

## B) Auth endpoints (admin)

| Method | Path | Description |
|--------|------|-------------|
| POST | `/api/v1/auth/login` | `{ "email", "password" }` → tokens |
| POST | `/api/v1/auth/refresh` | refresh access token |
| POST | `/api/v1/auth/logout` | invalidate refresh (if stored) |
| GET | `/api/v1/auth/me` | current admin user (Bearer required) |

**Login response example:**

```json
{
  "access_token": "...",
  "refresh_token": "...",
  "expires_in": 3600,
  "user": { "id": "...", "email": "...", "role": "admin" }
}
```

Seed **one admin user** via env or migration script (document credentials delivery securely — not in git).

---

## C) Admin endpoints (Bearer JWT required)

All mutating routes require `Authorization: Bearer <access_token>`.

### Profile

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/v1/admin/profile` | Get profile |
| PUT | `/api/v1/admin/profile` | Upsert/update profile |

### Experiences

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/experiences` |
| POST | `/api/v1/admin/experiences` |
| GET | `/api/v1/admin/experiences/:id` |
| PATCH | `/api/v1/admin/experiences/:id` |
| DELETE | `/api/v1/admin/experiences/:id` |

### Projects

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/projects` |
| POST | `/api/v1/admin/projects` |
| GET | `/api/v1/admin/projects/:id` |
| PATCH | `/api/v1/admin/projects/:id` |
| DELETE | `/api/v1/admin/projects/:id` |

### Skills

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/skills` |
| POST | `/api/v1/admin/skills` |
| PATCH | `/api/v1/admin/skills/:id` |
| DELETE | `/api/v1/admin/skills/:id` |

### Educations

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/educations` |
| POST | `/api/v1/admin/educations` |
| PATCH | `/api/v1/admin/educations/:id` |
| DELETE | `/api/v1/admin/educations/:id` |

### Certifications

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/certifications` |
| POST | `/api/v1/admin/certifications` |
| PATCH | `/api/v1/admin/certifications/:id` |
| DELETE | `/api/v1/admin/certifications/:id` |

### Languages

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/languages` |
| POST | `/api/v1/admin/languages` |
| PATCH | `/api/v1/admin/languages/:id` |
| DELETE | `/api/v1/admin/languages/:id` |

### Settings

| Method | Path |
|--------|------|
| GET | `/api/v1/admin/settings` |
| PUT | `/api/v1/admin/settings` |

### Reorder (nice-to-have, recommended)

| Method | Path | Body |
|--------|------|------|
| PATCH | `/api/v1/admin/:resource/reorder` | `{ "ordered_ids": ["uuid", "..."] }` |

Where `:resource` ∈ `experiences` \| `projects` \| `skills` \| `educations` \| `certifications` \| `languages`.

---

## D) Upload endpoints (admin, Bearer required)

| Method | Path | Multipart field | Returns |
|--------|------|-----------------|---------|
| POST | `/api/v1/admin/uploads/avatar` | `file` | `{ "url": "https://..." }` |
| POST | `/api/v1/admin/uploads/project-image` | `file` | `{ "url": "https://..." }` |
| POST | `/api/v1/admin/uploads/resume` | `file` | `{ "url": "https://..." }` |

**Constraints:**
- Images: `image/jpeg`, `image/png`, `image/webp`, max **5 MB**
- Resume: `application/pdf`, max **10 MB**
- Storage: S3-compatible / Cloudinary / local disk for dev (document choice)
- Returned `url` must be publicly readable for the portfolio site

---

## JSON field contract (Flutter-compatible)

Use **snake_case** exactly as below.

### Profile

```json
{
  "id": "uuid",
  "full_name": "Jwan Khalil",
  "title": "Flutter Developer | Informatics Engineer",
  "summary": "...",
  "email": "jwan8khalil@gmail.com",
  "phone": "+963 936 575 588",
  "location": "Aleppo, Syria",
  "linkedin_url": "https://linkedin.com/in/jwan-khalil",
  "github_url": "https://github.com/jwankhalil",
  "avatar_url": null,
  "resume_url": null
}
```

### Experience

```json
{
  "id": "uuid",
  "company": "BSS FLOW",
  "role": "Flutter Developer",
  "employment_type": "Full-time",
  "location": null,
  "start_date": "2026-08-01",
  "end_date": null,
  "is_current": true,
  "highlights": ["...", "..."],
  "sort_order": 0
}
```

### Project

```json
{
  "id": "uuid",
  "title": "Bookly App",
  "description": "...",
  "github_url": "https://github.com/jwankhalil/Bookly.git",
  "live_url": null,
  "image_url": "https://...",
  "tech_stack": ["Cubit", "go_router", "Clean Architecture"],
  "is_featured": true,
  "sort_order": 0
}
```

### Skill / Education / Certification / Language

Follow the domain tables above with snake_case keys:  
`icon_key`, `start_date`, `end_date`, `is_current`, `credential_url`, `sort_order`, etc.

---

## Seed data (required for handoff)

Provide a seed script that inserts initial content matching the resume:

- Profile: Jwan Khalil
- Experiences: BSS FLOW (current), Freelance Restaurant Dashboard (2024)
- Projects: Bookly, Delivery App, News App, Restaurant Dashboard
- Skills: BLoC/Cubit/Provider/GetX, Clean Architecture, Dio/REST/GraphQL, go_router/get_it, Git/Firebase, Responsive/Theming/Material
- Education: Master’s Web Science (SVU, current), Bachelor’s Informatics Engineering (Aleppo University)
- Certifications: Coursera + Udemy Flutter/Clean Architecture courses
- Languages: Kurdish Native, Arabic Native, English B2
- Site settings: title `Jwan Khalil — Flutter Developer`, theme `system`

Frontend can then point to API and drop local fallback later.

---

## Security checklist

- [ ] Public routes are **read-only** (except optional contact)
- [ ] All `/admin/**` and upload routes require valid JWT
- [ ] Passwords hashed (bcrypt/argon2)
- [ ] Rate-limit login + contact
- [ ] Helmet / standard Nest security middleware
- [ ] No secrets in repo; env-based config
- [ ] Input validation on every write DTO
- [ ] File type + size validation on uploads

---

## Deliverables

1. NestJS repo with modules: `auth`, `portfolio` (public), `admin/*`, `uploads`
2. DB migrations + seed script
3. Swagger at `/api/docs`
4. `.env.example`
5. README: how to run locally, create admin, seed, deploy notes
6. Postman/Insomnia collection **or** exported OpenAPI JSON
7. Staging URL for Flutter integration

---

## Acceptance criteria

- [ ] `GET /api/v1/portfolio` returns complete valid payload without auth
- [ ] Admin can login and CRUD all content types
- [ ] Uploads return public URLs usable in profile/projects
- [ ] CORS works from Flutter web local + staging origin
- [ ] Seed populates realistic resume data
- [ ] Swagger documents all endpoints
- [ ] Unauthorized requests to admin routes return `401`
- [ ] Invalid bodies return `400` with clear messages

---

## Estimate (for planning)

| Slice | Rough effort |
|-------|----------------|
| Project setup + DB models + migrations | 1–2 d |
| Public portfolio APIs + seed | 1 d |
| Auth + admin CRUD | 2–3 d |
| Uploads + storage | 1 d |
| Swagger, hardening, staging deploy | 1 d |
| **Total** | **~6–8 days** |

---

## Flutter integration notes (for backend awareness)

- Frontend will call `GET /api/v1/portfolio` as the primary endpoint.
- JSON must use **snake_case** keys listed above.
- Base URL will be configured via env / dart-define (e.g. `API_BASE_URL`).
- Admin dashboard is a **later** ticket; backend should still ship admin APIs in this ticket.

---

## Contacts / questions

Clarify with frontend before coding if needed:

1. Storage provider preference (S3 vs Cloudinary vs other)
2. Staging domain / CORS origins
3. Whether contact form is in v1 or deferred
