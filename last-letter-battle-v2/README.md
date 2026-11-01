# Last Letter Battle v2

Yangi versiya alohida papkada: `/last-letter-battle-v2/`. Eski `last-letter-battle/` papkasi o‘zgartirilmagan.

## Ishga tushirish
GitHub Pages manzili:
`https://rruslan-008.github.io/Dars2/last-letter-battle-v2/`

Frontend Supabase publishable key bilan ulanadi. Hech qachon `service_role` yoki secret keyni brauzerga joylamang.

## Yangi versiyadagi tuzatishlar
- O‘qituvchi panelida ikkala guruh uchun alohida jonli ishtirokchilar ro‘yxati.
- Supabase Realtime xabarlari va 1.5 soniyalik zaxira polling.
- Ro‘yxatni qo‘lda yangilash tugmasi.
- QR-kod: avval brauzer kutubxonasi, ishlamasa zaxira QR xizmati; har doim ko‘rinadigan to‘g‘ridan-to‘g‘ri xona havolasi.
- O‘quvchi identifikatori brauzerda xona+ism bo‘yicha saqlanadi va `llb_players.id` bo‘yicha upsert qilinadi. Shu qurilmada qayta bosish yoki qayta yuklash yangi dublikat qator yaratmaydi.
- Qo‘shilish tugmasi so‘rov tugaguncha bloklanadi.
- Jamoa qiymatlari raqamga normallashtiriladi.

## Mavjud Supabase sxemasi
Ilova quyidagi mavjud obyektlardan foydalanadi:
- `public.llb_rooms`
- `public.llb_players` (`id` UUID primary key, `room_code`, `name`, `team`, `created_at`)
- `public.llb_game`
- `verify_teacher_pin(p_code, p_pin)` RPC
- `supabase_realtime` publication: `llb_players`, `llb_game`

Agar yangi loyiha bazasi yaratilsa, ushbu sxema va RLS policylar ham ko‘chirilishi kerak. Hozirgi versiya avvaldan ishlayotgan Supabase loyihasiga ulangan.

## Sinov
GitHub Actions `tests/smoke.mjs` orqali inline JavaScript sintaksisini va muhim UI elementlarini tekshiradi. Bu avtomatik statik smoke-test; haqiqiy ikki telefonli sinov o‘rnini bosmaydi.

## Eslatma
Idempotent join bir xil brauzerda xona va ism bir xil bo‘lsa, o‘sha UUID qatorini yangilaydi. Boshqa qurilmada ayni ism bilan kirish boshqa qurilma sifatida qabul qilinadi. Bir sinfda bir xil ismli o‘quvchilar bo‘lsa, ismga qo‘shimcha identifikator kiritish tavsiya etiladi.
