# Philip Kantewa — Portfolio

Static portfolio for an Acumatica-trained business-systems engineer with production full-stack,
ERP, data, and AI experience.

**Live site:** <https://phil2001na.github.io/portfolio>

## Positioning

The site leads with three forms of evidence:

1. Responsibility for live client business systems, described without publishing client source.
2. Completed Acumatica T200 training and an original customization roadmap.
3. Personal engineering systems with explicit verification and simulation boundaries.

The source is intentionally a single hand-authored HTML page with local assets. There is no
framework, package install, analytics tracker, or build step.

## Preview

Open `index.html` directly, or serve the directory locally:

```powershell
python -m http.server 8080
```

Then visit <http://localhost:8080>.

## Verify

```powershell
powershell -ExecutionPolicy Bypass -File .\verify-portfolio.ps1
```

The verifier checks local assets, fragment links, duplicate IDs, balanced structural tags,
required metadata, safe new-tab links, and accidental local filesystem references.

Browser-based desktop/mobile review remains a required release step because static checks cannot
prove visual layout.

## Publication boundary

- Client repositories and operational details remain private.
- Personal repositories are linked only after their secrets, history, assets, and licensing have
  been reviewed.
- In-progress Acumatica work is labelled in progress and is developed separately from Acumatica's
  official course examples.
- Local changes do not reach GitHub Pages until they are intentionally committed and pushed.

