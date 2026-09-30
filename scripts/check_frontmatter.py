"""Check that every page in docs/ has front matter GitBook can parse.

GitBook sync fails on the whole space if a single page has invalid YAML
front matter, so catch it in CI before it reaches GitBook.
"""

import sys
from pathlib import Path

import yaml

DOCS = Path(__file__).resolve().parent.parent / "docs"


def main() -> int:
    errors = 0
    for page in sorted(DOCS.rglob("*.md")):
        if ".gitbook" in page.parts or page.name == "SUMMARY.md":
            continue
        rel = page.relative_to(DOCS).as_posix()
        text = page.read_text(encoding="utf-8")
        if not text.startswith("---\n"):
            continue
        end = text.find("\n---\n", 4)
        if end == -1:
            print(f"docs/{rel}: front matter is not closed with ---")
            errors += 1
            continue
        try:
            data = yaml.safe_load(text[4:end])
        except yaml.YAMLError as e:
            print(f"docs/{rel}: invalid YAML front matter: {e}")
            errors += 1
            continue
        if not isinstance(data, dict):
            print(f"docs/{rel}: front matter must be a mapping")
            errors += 1

    if errors:
        return 1
    print("OK: all front matter is valid YAML")
    return 0


if __name__ == "__main__":
    sys.exit(main())
