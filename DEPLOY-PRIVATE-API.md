# SOLLEN Reservations – API privată (pregătită pentru configurare)

Această componentă **nu este încă publicată** și nu are o bază de date conectată. Calculatorul actual rămâne nemodificat. Fișierul admin-preview.html este doar un prototip cu salvare locală, NU o evidență sigură pentru rezervări reale.

## Configurare necesară în Cloudflare
1. Creează o bază de date **D1** (ex. `sollen-reservations-db`).
2. Creează un **Worker** separat pentru API și leagă D1 sub binding-ul `DB`.
3. Aplică schema din `db/schema.sql` în D1.
4. Adaugă două **secrete** Worker: `ADMIN_PASSWORD` (parolă lungă, unică) și `SESSION_SECRET` (cheie aleatorie lungă).
5. Setează variabila `ALLOWED_ORIGIN` la originea exactă a aplicației publicate (ex. `https://example.pages.dev`), fără slash final.
6. Publică `worker/index.js` ca Worker și conectează interfața la URL-ul API. Nu publica secrete în GitHub.
7. Activează limitarea încercărilor de autentificare (Cloudflare WAF/rate limiting) înainte de utilizarea reală.

API: `POST /api/login` cu `{"password":"..."}` returnează token cu valabilitate de 8 ore; `GET /api/reservations`, `POST /api/reservations`, `PUT /api/reservations/SOL-001` necesită header `Authorization: Bearer <token>`.

**De făcut înainte de utilizarea reală:** conectarea interfeței la API, testarea salvării și sincronizării, protecție împotriva cererilor simultane pentru același bungalow, backup D1 și autentificare întărită. Nu introduce date personale în câmpul de observații.
