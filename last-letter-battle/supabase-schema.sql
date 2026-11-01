create table if not exists public.llb_rooms (
  code text primary key,
  teacher_pin text not null,
  created_at timestamptz not null default now()
);
create table if not exists public.llb_players (
  id uuid primary key default gen_random_uuid(),
  room_code text not null references public.llb_rooms(code) on delete cascade,
  name text not null,
  team int not null check (team in (1,2)),
  created_at timestamptz not null default now()
);
create table if not exists public.llb_game (
  room_code text primary key references public.llb_rooms(code) on delete cascade,
  status text not null default 'waiting',
  selected1 jsonb,
  selected2 jsonb,
  turn int not null default 1,
  score1 int not null default 0,
  score2 int not null default 0,
  seconds int not null default 90,
  last_word text not null default '',
  used_words jsonb not null default '[]'::jsonb,
  words jsonb not null default '[]'::jsonb,
  ends_at timestamptz
);
alter table public.llb_rooms enable row level security;
alter table public.llb_players enable row level security;
alter table public.llb_game enable row level security;
create policy "public room access" on public.llb_rooms for all to anon, authenticated using (true) with check (true);
create policy "public player access" on public.llb_players for all to anon, authenticated using (true) with check (true);
create policy "public game access" on public.llb_game for all to anon, authenticated using (true) with check (true);
alter publication supabase_realtime add table public.llb_players;
alter publication supabase_realtime add table public.llb_game;
