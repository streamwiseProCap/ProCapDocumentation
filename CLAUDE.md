# ProCap user documentation

This repository contains the end-user documentation for **ProCap**, the flow-field measurement software by streamwise. It is published with **GitBook** through Git Sync. Only the `docs/` folder is published.

## Repository layout

* `gitbook-docs.yaml`: GitBook site configuration. It maps the `docs/` directory to the site's default space. Do not rename `docs/` without updating this file.
* `docs/SUMMARY.md`: the table of contents. GitBook shows only pages listed here.
* `docs/README.md`: the home page.
* `docs/<section>/*.md`: content pages, one folder per section.
* `docs/.gitbook/assets/`: images and other files. GitBook stores uploads made in its editor here too.
* `CONTENT_PLAN.md`: the status of each page and the code-base sources to write it from. Keep it current.
* `templates/page.md`: the starting point for new pages.
* `scripts/check_summary.py`: checks that `SUMMARY.md` and the files in `docs/` match.
* `.github/workflows/docs-checks.yml`: CI that runs markdownlint, the summary check and an offline link check.

## Source of truth: the ProCap code base

The code base is at `C:\Users\AndrinLandolt\core_engine`. It is a Unity 6 project (C#), and the Unity project itself is in the `core_engine\core_engine\` subfolder. Read it to confirm behavior, labels and limits before you document them.

* Edition features and limits: `Assets\Scripts\Control\EditionCapabilities.cs`.
* UI panels:
  * Controllers: `Assets\Scripts\UI\ProCapUi\Panels\<Name>Window\`.
  * Display names: `Assets\Resources\UI\Panels\*.asset`.
* Tooltip texts: `Assets\Resources\TooltipSettings.asset`.
* Release notes written for customers: `core_engine\WhatsNew_ProCap_2027.docx`.
  * The best source for describing features.
  * Extract its text by unzipping `word/document.xml`.
* Installation folder layout: `Assets\Scripts\Configuration\AppPaths.cs`.
* `docs\technical\` and `docs\encryption\` in the code base are **internal** specifications. Use them to understand concepts. Never copy implementation details, security details or internal names into the user documentation.

## Writing conventions

* The audience is engineers and technicians who measure flow fields (for example in wind tunnels). They know aerodynamics but not ProCap's internals.
* Use US English, matching the software UI (for example "Visualization", "color map").
* Write UI labels in **bold**, exactly as the software shows them, including capitalization (for example **START MEASUREMENT**, **Interpolation Settings**).
* Use task-oriented pages: a short introduction, then numbered steps, then a reference table of settings where one is useful.
* Every page starts with front matter that has a `description:` (shown as the page subtitle) and exactly one H1 that matches the title in `SUMMARY.md`.
* Mark edition-restricted features with the standard hint at the top of the page, worded like the existing pages:

  ```markdown
  {% hint style="info" %}
  **Editions:** Professional and Professional Reader.
  {% endhint %}
  ```

* Use GitBook blocks (`{% hint %}`, `{% tabs %}`, `{% stepper %}`, `<figure>`) where they help. Do not use features GitBook cannot render.
* Link between pages with relative Markdown links to the `.md` file.
* Put images in `docs/.gitbook/assets/` and give them descriptive kebab-case names (for example `probe-panel-overview.png`).
* Units: m/s, Pa, N, Nm, m³/h, as in the software.
* Do not mention internal class names, file paths inside the code base, or the names of internal tools.

## Adding or changing a page

1. Copy `templates/page.md` into the right section folder. Use a kebab-case file name.
2. Add the page to `docs/SUMMARY.md`.
3. Update the page's row in `CONTENT_PLAN.md`.
4. Run the checks (see `README.md`). CI runs the same checks.

## Environment notes

* `git` is not on the PowerShell PATH on this machine.
* The only Python on PATH is the Windows Store stub, so `scripts/check_summary.py` may not run locally. It does run in CI.
