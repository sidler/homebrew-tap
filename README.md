# sidler/homebrew-tap

A Homebrew tap for my own macOS apps.

```bash
brew tap sidler/tap
brew install --cask githubmonitor
```

## What is in here

| Cask | What it is |
|---|---|
| `githubmonitor` | [GitHub Monitor](https://github.com/sidler/GitHubMonitor) — a menu bar app for the GitHub work waiting on you: the reviews, the issues and the mentions, with the diffs and the approving close enough that most of it needs no browser. |

The apps are signed with a Developer ID and notarised by Apple, so they
open without a Gatekeeper warning.

## Why a tap of its own

Homebrew's official cask repository asks a new package to show public
interest beyond its author — and rather more of it when the author submits
their own work. A tap needs no such thing, and `brew upgrade` keeps casks
from it up to date exactly as it does the official ones.
