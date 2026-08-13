# Updates

## 2026-08-13 00:30
- Visual redesign pass: animated gradient blobs + dot-grid texture in the background, gradient
  hero name and glowing rotating aura behind the photo, shine-sweep on the primary button,
  color-coded project tags (teal/amber/coral/violet), gradient-clip stat numbers with accent
  bars, gradient section-label bars, and a scroll progress indicator.
- Verified live in-browser (local server) before pushing: reveal animations, hover states, and
  new elements all render correctly.

## 2026-08-13 00:00
- Added direct GitHub source links to The Keeper and Security Payroll & Accounting cards now that
  those repos are public.
- Added a new Ember project card (AI cooking copilot PWA) with live + source links.
- Bumped the "live systems in production" stat from 6 to 7 to account for Ember.

## 2026-08-03 03:01
- Repositioned the local portfolio draft around Acumatica and business-systems engineering while
  preserving honest production/client boundaries and marking the original customization as in progress.
- Added verified WayaMe Gateway and Memecoin Lab evidence cards, using real local test/build results
  and explicit simulator/read-only boundaries rather than unverified performance claims.
- Replaced the placeholder README and added `verify-portfolio.ps1`; verification passes for assets,
  fragment links, IDs, structural tags, metadata, new-tab safety, and local-path leakage.

## 2026-07-10 15:55
- Full redesign: dark editorial theme (Fraunces serif display + Inter + JetBrains Mono), scroll-reveal animations, refined palette, SVG favicon, OG/meta tags.
- Fixed broken project screenshots — they pointed at local `../../Pictures/...` paths that 404'd on the live site; images now compressed to JPEG and committed under `assets/`.
- Replaced the 1 MB embedded base64 hero photo with a 60 KB `assets/philip.jpg` (page weight ~1 MB → ~90 KB HTML).
- Added the university SIS as a featured "production client work" card with an SVG architecture diagram and the duplicate-account war story; repositioned copy around "I own systems after they ship" + UTC+2 EU-overlap selling point.
- Scroll reveals are progressive-enhancement (hidden only when JS runs), verified desktop + mobile via Playwright.
