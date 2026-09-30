-- Portfolio schema for public site + future admin dashboard
-- Public read for anon; authenticated write for dashboard editors

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------------------
-- Profile (single-row content owner)
-- ---------------------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  title text not null,
  summary text not null,
  email text not null,
  phone text,
  location text,
  linkedin_url text,
  github_url text,
  avatar_url text,
  resume_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Experiences
-- ---------------------------------------------------------------------------
create table if not exists public.experiences (
  id uuid primary key default gen_random_uuid(),
  company text not null,
  role text not null,
  employment_type text,
  location text,
  start_date date not null,
  end_date date,
  is_current boolean not null default false,
  highlights text[] not null default '{}',
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Projects
-- ---------------------------------------------------------------------------
create table if not exists public.projects (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text not null,
  github_url text,
  live_url text,
  image_url text,
  tech_stack text[] not null default '{}',
  sort_order int not null default 0,
  is_featured boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Skills
-- ---------------------------------------------------------------------------
create table if not exists public.skills (
  id uuid primary key default gen_random_uuid(),
  category text not null,
  name text not null,
  icon_key text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Education
-- ---------------------------------------------------------------------------
create table if not exists public.educations (
  id uuid primary key default gen_random_uuid(),
  degree text not null,
  institution text not null,
  start_date date,
  end_date date,
  is_current boolean not null default false,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Certifications
-- ---------------------------------------------------------------------------
create table if not exists public.certifications (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  issuer text not null,
  credential_url text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Languages
-- ---------------------------------------------------------------------------
create table if not exists public.languages (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  proficiency text not null,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Site settings (theme defaults, SEO, feature flags)
-- ---------------------------------------------------------------------------
create table if not exists public.site_settings (
  id uuid primary key default gen_random_uuid(),
  site_title text not null default 'Portfolio',
  default_theme text not null default 'system' check (default_theme in ('light', 'dark', 'system')),
  accent_color text,
  seo_description text,
  updated_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- updated_at trigger
-- ---------------------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists profiles_set_updated_at on public.profiles;
create trigger profiles_set_updated_at
  before update on public.profiles
  for each row execute function public.set_updated_at();

drop trigger if exists experiences_set_updated_at on public.experiences;
create trigger experiences_set_updated_at
  before update on public.experiences
  for each row execute function public.set_updated_at();

drop trigger if exists projects_set_updated_at on public.projects;
create trigger projects_set_updated_at
  before update on public.projects
  for each row execute function public.set_updated_at();

drop trigger if exists site_settings_set_updated_at on public.site_settings;
create trigger site_settings_set_updated_at
  before update on public.site_settings
  for each row execute function public.set_updated_at();

-- ---------------------------------------------------------------------------
-- Row Level Security
-- ---------------------------------------------------------------------------
alter table public.profiles enable row level security;
alter table public.experiences enable row level security;
alter table public.projects enable row level security;
alter table public.skills enable row level security;
alter table public.educations enable row level security;
alter table public.certifications enable row level security;
alter table public.languages enable row level security;
alter table public.site_settings enable row level security;

-- Public read (anon + authenticated)
create policy "Public read profiles" on public.profiles for select using (true);
create policy "Public read experiences" on public.experiences for select using (true);
create policy "Public read projects" on public.projects for select using (true);
create policy "Public read skills" on public.skills for select using (true);
create policy "Public read educations" on public.educations for select using (true);
create policy "Public read certifications" on public.certifications for select using (true);
create policy "Public read languages" on public.languages for select using (true);
create policy "Public read site_settings" on public.site_settings for select using (true);

-- Authenticated write for future dashboard
create policy "Auth write profiles" on public.profiles
  for all to authenticated using (true) with check (true);
create policy "Auth write experiences" on public.experiences
  for all to authenticated using (true) with check (true);
create policy "Auth write projects" on public.projects
  for all to authenticated using (true) with check (true);
create policy "Auth write skills" on public.skills
  for all to authenticated using (true) with check (true);
create policy "Auth write educations" on public.educations
  for all to authenticated using (true) with check (true);
create policy "Auth write certifications" on public.certifications
  for all to authenticated using (true) with check (true);
create policy "Auth write languages" on public.languages
  for all to authenticated using (true) with check (true);
create policy "Auth write site_settings" on public.site_settings
  for all to authenticated using (true) with check (true);
