# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog, and this project follows Semantic Versioning.

## [0.3.0] - 2026-03-12

### Added

- Daily workflow commands:
  - `start-day`
  - `feature resume`
  - `feature cleanup`
- Task-oriented menu actions for:
  - start workday
  - submit current feature for review
  - clean up current feature after merge
- Shell helper `fresume`
- Ongoing roadmap document under `docs/roadmap-next.md`

### Changed

- `feature submit` is now platform-agnostic and only performs ship + publish + next-step guidance
- Main workflow is now more Git-native, with GitHub-specific helpers treated as optional
- Dashboard shows stronger attention signals for dirty worktrees, stale worktrees, and upstream state
- GitHub helper set now includes status, publish, and submit helpers for optional GitHub-based workflows

## [0.2.0] - 2026-03-11

### Added

- Cockpit tmux layouts: `solo`, `review`, `ai-pair`, and `multi-feature`
- `bga cockpit list-layouts` and explicit layout selection for `cockpit` and `worktree tmux`
- Lazygit config management helpers:
  - `lazygit-config diff`
  - `lazygit-config backup`
  - `lazygit-config merge-hint`
- Worktree lifecycle helpers:
  - `feature finish`
  - `worktree stale`
  - `worktree clean`

### Changed

- Improved `doctor` diagnostics with PATH checks, shell helper guidance, interactive feature readiness, and actionable next steps
- `feature start` and `worktree add` now print clean path-only output for scripting use
- Expanded README guidance for tmux cockpit layouts, cleanup flows, and lazygit config management

## [0.1.1] - 2026-03-11

### Added

- Beginner-friendly day-to-day tutorial under `docs/day-to-day.md`
- Lazygit-focused daily workflow guide and cheatsheet for new users

### Changed

- Removed hard-coded local home directory paths from Markdown documentation
- Improved README shell integration examples to use generic paths

## [0.1.0] - 2026-03-11

### Added

- Core `bga` command launcher with Git workflow helpers
- Global Git alias include file and installer
- Worktree-focused feature workflow
- `fzf`-based menu, branch picker, worktree picker, and commit browser
- `lazygit`, `tmux`, `codex`, and `cline` integrations
- Curated lazygit config with workflow shortcuts
- Shell helpers for worktree navigation and AI CLI entrypoints
- `doctor`, `bootstrap`, and `lazygit-config` commands
- README with install guide, tutorial, demo, screenshots plan, and lazygit workflow guide
- Safe `uninstall.sh`
- Demo asset guidance under `docs/assets/`
