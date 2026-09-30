"""Check that docs/SUMMARY.md and the Markdown files in docs/ are in sync.

Fails if SUMMARY.md links to a missing file, or if a page exists that is not
listed in SUMMARY.md (GitBook would silently leave it out of the navigation).
"""

import re
import sys
from pathlib import Path

DOCS = Path(__file__).resolve().parent.parent / "docs"
LINK = re.compile(r"\]\(([^)#\s]+\.md)(?:#[^)]*)?\)")


def main() -> int:
    summary = (DOCS / "SUMMARY.md").read_text(encoding="utf-8")
    listed = {Path(p).as_posix() for p in LINK.findall(summary)}

    pages = {
        p.relative_to(DOCS).as_posix()
        for p in DOCS.rglob("*.md")
        if ".gitbook" not in p.parts and p.name != "SUMMARY.md"
    }

    missing = sorted(listed - pages)
    unlisted = sorted(pages - listed)

    for p in missing:
        print(f"SUMMARY.md links to missing file: docs/{p}")
    for p in unlisted:
        print(f"Page not listed in SUMMARY.md: docs/{p}")

    if missing or unlisted:
        return 1
    print(f"OK: {len(pages)} pages, all listed in SUMMARY.md")
    return 0


if __name__ == "__main__":
    sys.exit(main())
