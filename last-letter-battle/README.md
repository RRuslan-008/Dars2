# Last Letter Battle

90 soniyalik, o‘qituvchi boshqaradigan inglizcha so‘z zanjiri o‘yini.

## 1. Supabase backendni sozlash

1. https://supabase.com saytida bepul loyiha yarating.
2. SQL Editor bo‘limiga kiring va quyidagi `supabase-schema.sql` fayl mazmunini ishga tushiring.
3. Project Settings → API bo‘limidan Project URL va anon/public key ni oling.
4. `index.html` ichidagi `SUPABASE_URL` va `SUPABASE_ANON_KEY` qiymatlarini o‘zingiznikiga almashtiring.
5. Supabase → Database → Replication (yoki Publications) ichida `llb_players` va `llb_game` jadvallari uchun Realtime yoqilganini tekshiring.

## 2. GitHub Pages

Repository Settings → Pages → Build and deployment → Deploy from a branch → `main` → `/(root)` → Save.
Bu loyiha `last-letter-battle/` papkasida bo‘lsa, sayt manzili:
`https://USERNAME.github.io/REPOSITORY/last-letter-battle/`

## 3. O‘ynash

- Saytni ochib, o‘qituvchi parolini kiriting va **Xona yaratish** tugmasini bosing.
- QR-kodni proyektorda ko‘rsating.
- O‘quvchilar QR orqali kirib, ism va jamoasini tanlaydi.
- O‘qituvchi ikkala barabanni aylantirib, **START · 90 SEC** tugmasini bosadi.
- Faqat tanlangan ikki o‘quvchi o‘z telefonidan so‘z yubora oladi.
- To‘g‘ri so‘z keyingi jamoaga navbat beradi; 90 soniya tugagach natija chiqadi.

## Eslatma

Realtime o‘yin uchun Supabase konfiguratsiyasi shart. Faqat GitHub Pages o‘zi bir nechta telefon orasida umumiy holatni sinxronlamaydi. Bu boshlang‘ich sinf/classroom loyihasi: jadval siyosatlari ommaviy xona kodiga asoslangan soddalashtirilgan RLS bilan berilgan. Ochiq internetda maxfiy yoki shaxsiy ma’lumot kiritmang.
