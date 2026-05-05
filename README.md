# homebrew-tap (Draft)

> Draft only — files here will be pushed to **`fummicc1/homebrew-tap`**.
> Bootstrap plan: rename the existing empty `fummicc1/homebrew-csv2img` repository to `homebrew-tap` (no new repo creation needed). Future fummicc1 OSS tools share this tap going forward.

## Target Layout

```
homebrew-tap/                       # repo: fummicc1/homebrew-tap (renamed from homebrew-csv2img)
├── Formula/
│   ├── swift-complexity.rb         # CLI tool (primary)
│   └── swift-complexity-mcp.rb     # MCP server (optional companion)
└── README.md
```

## Install Commands (User-Facing)

```bash
# Add tap (one-time)
brew tap fummicc1/tap

# Install CLI
brew install fummicc1/tap/swift-complexity

# Install MCP server (optional)
brew install fummicc1/tap/swift-complexity-mcp
```

Short form (after `brew tap`):

```bash
brew install swift-complexity
brew install swift-complexity-mcp
```

## Why prebuilt binary, not build-from-source?

The legacy sibling tap `homebrew-geohash` uses build-from-source — that pattern requires Xcode and takes minutes. swift-complexity already produces multi-arch binary tarballs (`SwiftComplexityCLI-<ver>-{macos-arm64,macos-x86_64,linux-x86_64}.tar.gz`) in `release.yml`. Using those:

| | build-from-source | prebuilt binary (this draft) |
|---|---|---|
| Install time | 2–5 min | <10s |
| Requires Xcode | Yes | No |
| Linux support | No (current setup) | Yes |
| Tied to release artifacts | No | Yes (auto-updated by CI) |

## Why a tap (not homebrew-core)?

- homebrew-core requires 30+ days of stable releases, broad usability, and avoids "single-binary download" formulas without strong justification. A personal tap is the standard path for project-specific CLI distribution.
- We can graduate to homebrew-core later once adoption metrics justify it.

## Sha256 Sources

The release workflow emits per-architecture sha256 files alongside each tarball and uploads them to the GitHub Release. The Formula auto-update job (see `release.yml.diff`) downloads them and patches the Formula in this tap on each tag push.

For manual bootstrap or future debugging:

```bash
VERSION=0.1.0
BASE="https://github.com/fummicc1/swift-complexity/releases/download/v${VERSION}"
for V in macos-arm64 macos-x86_64 linux-x86_64; do
  printf "CLI %-15s " "$V"
  curl -sSL "${BASE}/SwiftComplexityCLI-${VERSION}-${V}.tar.gz.sha256" | awk '{print $1}'
done
for V in macos-arm64 macos-x86_64 linux-x86_64; do
  printf "MCP %-15s " "$V"
  curl -sSL "${BASE}/SwiftComplexityMCP-${VERSION}-${V}.tar.gz.sha256" | awk '{print $1}'
done
```

## Verification (Local)

```bash
# Tap from local checkout (skip remote)
brew tap fummicc1/tap /path/to/homebrew-tap

brew install fummicc1/tap/swift-complexity
brew test swift-complexity
brew audit --new-formula --strict fummicc1/tap/swift-complexity
```

## Auto-Update Pipeline

After the initial bootstrap, `release.yml` (see `release.yml.diff`) bumps `version` and rewrites all sha256 entries on every non-prerelease tag. No manual Formula edits needed thereafter.

## Future Migration (Optional, Not Now)

- `fummicc1/homebrew-geohash` can later be folded into this tap by copying `Formula/geohash.rb` over and archiving the old repo. Not required for swift-complexity launch.
