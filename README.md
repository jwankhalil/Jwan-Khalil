# Jwan Khalil — Flutter Web Portfolio

Animated, responsive Flutter web portfolio for **Jwan Khalil** (Flutter Developer). Content is Supabase-backed with a local seed fallback so the site runs before you connect a project.

## Design

Obsidian + Emerald developer aesthetic (inspired by premium Dribbble / Supabase-style portfolios):

- Near-black / soft paper surfaces with emerald `#3ECF8E` accent
- **Sora** for display/body, **JetBrains Mono** for labels/code
- Mesh gradient background, scroll reveals, floating hero code card, hover lifts
- Light / dark / system theming (persisted)

## Stack

- Flutter Web + Clean Architecture
- Cubit (`flutter_bloc`), `go_router`, `get_it`, `dartz`, `freezed`
- `easy_localization` (EN + AR)
- `flutter_screenutil` + breakpoint layout
- `supabase_flutter` for remote content

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

With Supabase connected:

```bash
flutter run -d chrome \
  --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=YOUR_ANON_KEY
```

Without dart-defines, the app uses built-in resume seed data.

## Supabase setup

1. Create a project at [supabase.com](https://supabase.com).
2. In the SQL editor (or via CLI), run:
   - `supabase/migrations/20260329120000_portfolio_schema.sql`
   - `supabase/seed.sql`
3. Copy Project URL + anon key into `--dart-define` (or `.env.example` as a reminder).

### Local Supabase (optional)

Requires Docker + [Supabase CLI](https://supabase.com/docs/guides/cli):

```bash
npx supabase start
npx supabase db reset
```

Then point Flutter at the local URL/anon key printed by the CLI.

### Schema (dashboard-ready)

Tables with public **read** and authenticated **write** (for a future admin dashboard):

| Table | Purpose |
|-------|---------|
| `profiles` | Name, title, summary, contact links |
| `experiences` | Work history + highlights |
| `projects` | Portfolio projects |
| `skills` | Categorized skills |
| `educations` | Degrees |
| `certifications` | Certificates |
| `languages` | Spoken languages |
| `site_settings` | Theme defaults / SEO |

## Project layout

```
lib/
  core/           # theme, router, DI helpers, shared widgets
  features/portfolio/
    domain/       # entities, repository, use cases
    data/         # Supabase source, freezed models, seed fallback
    presentation/ # Cubit + animated sections
supabase/         # migrations + seed
assets/translations/
```

## Next: admin dashboard

Auth-gated Flutter (or web) app can CRUD the same tables using the authenticated write policies already defined in the migration.
