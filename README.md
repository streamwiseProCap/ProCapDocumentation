# ProCap Documentation

Source of the ProCap user documentation, published with [GitBook](https://www.gitbook.com/).

## How publishing works

GitBook Git Sync connects this repository (`main` branch) to the GitBook site. `gitbook-docs.yaml` tells GitBook to publish the `docs/` folder as the default space.

* Changes pushed to `main` appear in GitBook automatically.
* Edits made in the GitBook editor are committed back to `main`. Pull before you start working.
* Only pages listed in `docs/SUMMARY.md` appear in the navigation.

### One-time GitBook setup

1. In GitBook, create or open the space and choose **Configure → GitHub Sync**.
2. Install the GitBook GitHub app for `streamwiseProCap/ProCapDocumentation` and select the `main` branch.
3. For the initial sync, choose **GitHub → GitBook** so that the content in this repository is used.
4. Publish the space as a docs site, then set the visibility and custom domain under the site settings.

## Writing

* Conventions, sources and edition hints: [CLAUDE.md](CLAUDE.md)
* Page status and where to find the facts for each page: [CONTENT_PLAN.md](CONTENT_PLAN.md)
* Template for new pages: [templates/page.md](templates/page.md)

To preview your changes, push a branch and open it in GitBook (Git Sync shows branch previews via change requests). You can also work directly in the GitBook editor.

## Checks

CI (`.github/workflows/docs-checks.yml`) runs these on every push and pull request:

* **markdownlint**, with the rules in `.markdownlint.jsonc`.
* **Summary check**: every page is in `SUMMARY.md` and every entry in `SUMMARY.md` exists.
* **Link check**: relative links between pages resolve. This check runs offline.

To run them locally (requires Node.js and Python 3):

```sh
npx markdownlint-cli2 "docs/**/*.md"
python scripts/check_summary.py
```
