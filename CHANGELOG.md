# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog, and this project follows Semantic Versioning.

## [0.5.2] - 2026-03-13

### Added

- `wsrecent` alias and workspace recent repo picker
- workspace attention summary and prioritization in `wsdash`
- roadmap portfolio document for higher-level planning
- provider capability matrix documentation

### Changed

- workspace views now prioritize dirty repos and repos with upstream issues
- workspace pickers now fall back cleanly outside interactive TTY sessions
- roadmap docs now distinguish portfolio, short-term queue, and version roadmaps

## [0.5.1] - 2026-03-13

### Added

- `remote-status` command and alias for branch, provider, and compare readiness summaries
- remote actions inside `git menu`
- `docs/roadmap-v0.6.0.md` for the next provider-aware documentation and review direction

### Changed

- Remote actions are now easier to discover without memorizing commands
- Host-aware workflow guidance now has a clearer next-step roadmap

## [0.5.0] - 2026-03-13

### Added

- `remote-open` command and alias for opening the current remote's web URL
- `remote-compare` command and alias for generating compare URLs on supported providers
- `docs/roadmap-v0.5.0.md` for the next host-aware project direction

### Changed

- The toolkit now has a clearer provider-aware but host-agnostic direction
- Remote parsing utilities now power higher-level remote actions, with safe fallback for unsupported compare URLs

## [0.4.2] - 2026-03-13

### Added

- `release-init` command and `git release-init` alias for scaffolding release note files
- `remote-info` command and `git remote-info` alias for inspecting GitHub, GitLab, Azure DevOps, and generic remotes

### Changed

- Release workflow now supports release note scaffolding from commits since the latest tag
- Remote parsing primitives now support Azure DevOps SSH and HTTPS URL formats

## [0.4.1] - 2026-03-12

### Added

- `protected_branches` support in repo defaults and user overrides
- `scripts/demo-workspace.sh` for a safe multi-repo playground
- `release-check` command and `git release-check` alias

### Changed

- `prune-merged` and feature cleanup previews now honor configured protected branches
- Demo and roadmap docs now cover workspace setup and release consistency checks

## [0.4.0] - 2026-03-12

### Added

- Config layer for personal overrides via `git config-bga`
- Workspace workflow commands:
  - `workspace list`
  - `workspace dash`
  - `workspace sync`
  - `workspace menu`
- Repo-level `.bga.env` conventions for shared team defaults
- Workspace aliases:
  - `git ws`
  - `git wsdash`
  - `git wssync`
  - `git wsmenu`
- Example repo config file: `.bga.env.example`

### Changed

- Config resolution now follows `user override > repo defaults > built-in defaults`
- Menu now includes workspace-oriented actions
- README and roadmap now document workspace usage and team conventions

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
