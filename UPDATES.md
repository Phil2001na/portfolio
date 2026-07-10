# Updates

## 2026-07-10 15:55
- Full redesign: dark editorial theme (Fraunces serif display + Inter + JetBrains Mono), scroll-reveal animations, refined palette, SVG favicon, OG/meta tags.
- Fixed broken project screenshots — they pointed at local `../../Pictures/...` paths that 404'd on the live site; images now compressed to JPEG and committed under `assets/`.
- Replaced the 1 MB embedded base64 hero photo with a 60 KB `assets/philip.jpg` (page weight ~1 MB → ~90 KB HTML).
- Added the university SIS as a featured "production client work" card with an SVG architecture diagram and the duplicate-account war story; repositioned copy around "I own systems after they ship" + UTC+2 EU-overlap selling point.
- Scroll reveals are progressive-enhancement (hidden only when JS runs), verified desktop + mobile via Playwright.
