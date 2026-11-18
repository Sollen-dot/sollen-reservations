CREATE TABLE IF NOT EXISTS reservations (
 id TEXT PRIMARY KEY,
 unit TEXT NOT NULL CHECK(unit IN ('Zefir','Pin Forest','Stone Peak')),
 check_in TEXT NOT NULL,
 check_out TEXT NOT NULL,
 people INTEGER NOT NULL,
 status TEXT NOT NULL CHECK(status IN ('provizorie','confirmata','anulata')),
 jacuzzi_days INTEGER NOT NULL DEFAULT 0,
 jacuzzi_rate INTEGER NOT NULL DEFAULT 150,
 pool INTEGER NOT NULL DEFAULT 0,
 sauna INTEGER NOT NULL DEFAULT 1,
 breakfast INTEGER NOT NULL DEFAULT 0,
 stay_price INTEGER NOT NULL DEFAULT 0,
 total INTEGER NOT NULL DEFAULT 0,
 deposit INTEGER NOT NULL DEFAULT 0,
 notes TEXT NOT NULL DEFAULT '',
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_reservations_dates ON reservations(unit,check_in,check_out);
CREATE TABLE IF NOT EXISTS counters (name TEXT PRIMARY KEY, value INTEGER NOT NULL);
INSERT OR IGNORE INTO counters(name,value) VALUES ('reservation',0);
