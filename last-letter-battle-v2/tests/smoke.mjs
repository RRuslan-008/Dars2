import { readFileSync } from "node:fs";
import assert from "node:assert/strict";

const html = readFileSync(new URL("../index.html", import.meta.url), "utf8");
const scripts = [...html.matchAll(/<script>([\\s\\S]*?)<\\/script>/gi)];
assert.ok(scripts.length, "inline application script exists");
const appScript = scripts.at(-1)[1];
new Function(appScript);
for (const id of [
  "teacherPanel", "refreshPlayers", "teacherList1", "teacherList2",
  "qr", "joinUrl", "joinRoom", "createRoom", "spin", "start"
]) assert.ok(html.includes('id="' + id + '"'), "missing UI element: " + id);
assert.ok(appScript.includes('.on("postgres_changes"'), "Realtime subscription is configured");
assert.ok(appScript.includes('setInterval(()=>scheduleRefresh(0),1500)'), "polling fallback is configured");
assert.ok(appScript.includes('.upsert({id,room_code:room,name,team},{onConflict:"id"})'), "join uses idempotent upsert");
assert.ok(appScript.includes("quickchart.io/qr"), "QR fallback is configured");
console.log("Smoke test passed: inline JS parses and required live-roster, QR, and duplicate-join safeguards exist.");
