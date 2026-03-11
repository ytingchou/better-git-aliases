# better-git-aliases

A practical Git CLI workflow for real work:

- Short aliases for common tasks
- Interactive `fzf` menus when available
- First-class `git worktree` support
- `lazygit`, `tmux`, `codex`, and `cline` integration
- A help screen and a menu so people can discover commands instead of memorizing everything

This repo does not try to replace Git. It wraps a few high-value workflows so they are faster, more consistent, and easier to learn.

Current version: `0.2.0`

License: [MIT](LICENSE)

## Demo

### Fast path

This is the intended happy path:

```bash
git doctor
git feature start checkout-flow
gwt checkout-flow
git cockpit
```

What that gives you:

- a fresh feature branch
- a dedicated worktree
- a tmux workspace around that worktree
- `lazygit` and optional AI CLI support in the same context

### Terminal walkthrough

```text
$ git doctor
[ok] git
[ok] bash
[ok] fzf
[ok] tmux
[ok] codex
[ok] cline

$ git feature start checkout-flow
../.worktrees/better-git-aliases/feature-checkout-flow

$ gwt checkout-flow
$ pwd
.../.worktrees/better-git-aliases/feature-checkout-flow

$ git lg
# open lazygit in this feature worktree

$ git cockpit
# open tmux with shell + git + AI windows
```

The important part is not the aliases themselves. It is the workflow shape:

- one feature = one branch
- one branch = one worktree
- one active feature = one stable terminal context

That is what makes parallel work less error-prone.

## Screenshots

Real screenshots are not checked in yet, but the README is structured so they can be dropped in cleanly later.

Suggested screenshots to add:

1. `git menu` with the right-side preview panel
2. `git recent` showing branch log preview
3. `git wt` picker showing worktree status/log/file preview
4. `lazygit` inside a feature worktree
5. `git cockpit` tmux session with shell/git/AI windows

Asset guidance lives in [docs/assets/README.md](docs/assets/README.md).

If you want to capture your own demo later, this is a good sequence:

```bash
git doctor
git menu
git feature start demo-branch
gwt demo-branch
git lg
git cockpit
```

## What you get

After installation, you can use:

```bash
git doctor
git bootstrap
git lazygit-config install
git menu
git workflow-help
git dash
git sync
git recent
git commits
git feature start login-page
git wt list
git wta hotfix/payment main
git wttmux
git lg
git codex
git cline
git cockpit
```

Optional shell functions:

```bash
gdoctor      # check environment
gwt          # jump to a selected worktree in the current shell
gmenu        # open the menu
gcockpit     # tmux cockpit for current/selected worktree
gcodex       # cd into a worktree, then launch codex
gcline       # cd into a worktree, then launch cline
```

## Design goals

This toolkit is optimized for day-to-day engineering work:

- Easy enough for normal Git users
- Fast enough for people juggling many branches
- Safe defaults around branch cleanup and worktree management
- Good discoverability through `git menu` and `git workflow-help`
- Better support for multi-feature work using `worktree` instead of constant stashing and branch switching

## Dependencies

Required:

- `git`
- `bash`

Recommended:

- `fzf` for interactive selection
- `lazygit` for visual Git operations
- `delta` for better lazygit diff paging
- `tmux` for persistent multi-pane workspaces
- `codex` and/or `cline` if you want AI-assisted terminals per worktree

Without `fzf`, the toolkit still works, but interactive pickers fall back to simpler behavior.

With `fzf`, these commands become much better:

- `git menu`: command descriptions in a side preview
- `git menu`: beginner-friendly task actions like starting a feature, resuming work, reviewing changes, and cleanup
- `git recent`: branch picker with commit/log preview
- `git wt ...`: worktree picker with status/log/file preview
- `git commits`: patch preview while browsing history

## Install

```bash
./install.sh
```

That installs:

- `~/.local/bin/bga`
- `~/.config/better-git-aliases/gitconfig.include`

And adds the include file to your global Git config.

If `~/.local/bin` is not in your `PATH`, add it in your shell config.

## Uninstall

```bash
./uninstall.sh
```

This removes:

- `~/.local/bin/bga`
- `~/.config/better-git-aliases/`
- the Git global `include.path` pointing to this toolkit
- `~/.config/lazygit/config.yml` only if it still matches the installed template exactly

You may still need to manually remove the `source .../bga.sh` line from your shell rc.

Then verify:

```bash
git doctor
```

`git doctor` now checks more than binary presence. It also reports:

- whether `~/.local/bin` is in `PATH`
- whether your shell rc references the helper script
- whether lazygit config is installed
- whether `fzf`, `tmux`, and `lazygit` features are actually available
- suggested next steps when something is missing

If you want the repo to help install common tools:

```bash
git bootstrap
```

This currently supports `brew` and `apt`.

The installer also writes a curated lazygit config to:

```bash
~/.config/lazygit/config.yml
```

If you want to re-install that config later:

```bash
git lazygit-config install
```

Useful lazygit config management commands:

```bash
git lazygit-config path
git lazygit-config diff
git lazygit-config backup
git lazygit-config merge-hint
```

## Optional shell integration

Git aliases cannot change your current shell directory. That matters for `worktree` workflows. To make jumping between worktrees ergonomic, add this to `~/.bashrc` or `~/.zshrc`:

```bash
source "/path/to/better-git-aliases/shell/bga.sh"
```

Or generate the line dynamically:

```bash
bga init bash
```

If you prefer writing it manually and you cloned this repo somewhere on disk, use your own clone path instead of a hard-coded example path:

```bash
source "/path/to/better-git-aliases/shell/bga.sh"
```

The key helper is `gwt`, which changes the current shell into a selected worktree.

## Command reference

### Discovery

- `git doctor`: check whether required/recommended tools are installed
- `git bootstrap [brew|apt]`: install recommended dependencies
- `git lazygit-config install`: install the bundled lazygit config
- `git lazygit-config path`: print the active lazygit config path
- `git lazygit-config diff`: compare your current config with the bundled template
- `git lazygit-config backup`: create a timestamped backup of your current config
- `git lazygit-config merge-hint`: show a safe merge workflow for custom configs
- `git workflow-help`: show all supported commands
- `git menu`: open an interactive task-oriented menu with descriptions
- `git dash`: show repo status plus attention signals for dirty worktrees, stale worktrees, and branch/upstream state

### Daily commands

- `git sync`: fetch all remotes and rebase current branch if it has an upstream
- `git recent`: fuzzy-pick a recently updated branch and check it out
- `git commits`: browse commit history with preview
- `git prune-merged`: remove merged local branches, excluding protected names

### Feature workflow

- `git feature start <name> [base]`: create `feature/<name>` and a dedicated worktree
- `git feature ship`: quick pre-push checklist for the current branch
- `git feature finish [branch] [--base base]`: remove merged managed worktrees and try to delete the local branch

### Worktree workflow

- `git wt list`: list worktrees
- `git wt stale [base]`: list stale managed worktrees already merged into the base branch
- `git wt clean [base] [--apply]`: dry-run or remove stale managed worktrees
- `git wta <branch> [base]`: create a new worktree under a shared `.worktrees/<repo>/` directory
- `git wtrm [query]`: remove a selected worktree
- `git wtpath [query]`: print a selected worktree path
- `git wttmux [query]`: open a selected worktree in a tmux session
- `git wttmux [query] --layout <solo|review|ai-pair|multi-feature>`: open a selected worktree in a chosen tmux layout

### Tool integration

- `git lg [query]`: open `lazygit` in current or selected worktree
- `git codex [query]`: run `codex` in current or selected worktree
- `git cline [query]`: run `cline` in current or selected worktree
- `git cockpit [query]`: create/attach a tmux session with shell + git + AI windows
- `git cockpit list-layouts`: show available tmux cockpit layouts
- `git cockpit [query] --layout <solo|review|ai-pair|multi-feature>`: choose a cockpit layout explicitly

## Usage tutorial

Want a shorter beginner-focused guide? See [docs/day-to-day.md](docs/day-to-day.md).
For the next planned milestone, see [docs/roadmap-v0.2.0.md](docs/roadmap-v0.2.0.md).

### 1. Learn the workflow in 30 seconds

Start here:

```bash
git doctor
git workflow-help
git menu
git dash
```

If you forget anything later, `git menu` is the recovery path. This is intentional: you should not need to memorize everything.
If `fzf` is installed, `git menu` also shows a right-side description panel for each action.
It now starts with task-oriented entries such as:

- `Start a new feature`
- `Resume existing feature`
- `Review and commit changes`
- `Clean up merged work`

If `fzf`, `lazygit`, or `tmux` are missing:

```bash
git bootstrap
```

### 2. Start one new feature

```bash
git feature start login-page
```

What happens:

- fetches remotes
- creates `feature/login-page` from your default base branch
- creates a dedicated worktree at something like:

```bash
../.worktrees/<repo>/feature-login-page
```

Then jump there:

```bash
gwt login-page
```

Or print the path with:

```bash
git wtpath login-page
```

This is the core upgrade over branch switching. Each feature gets its own directory.

### 3. Work on multiple features at once

Example:

```bash
git feature start billing-refactor
git feature start onboarding-modal
git feature start hotfix/session-timeout
```

Now list them:

```bash
git wt list
```

Pick one and open a focused workspace:

```bash
git wttmux
```

This opens a tmux session for the chosen worktree. If `lazygit` exists, one window runs it. If `codex` or `cline` exists, another window opens that AI CLI inside the same worktree.

This is useful when you are actively moving between several branches and do not want to repeatedly stash, re-checkout, and rebuild context.

### 4. Use lazygit where it helps

Inside the current repo:

```bash
git lg
```

Or choose a worktree first:

```bash
git lg onboarding
```

This works well for:

- staging partial hunks
- reviewing diffs
- checking stash/log/branches visually

The bundled lazygit config also adds workflow shortcuts:

- `Ctrl-W`: open tmux cockpit for the current repo/worktree
- `Ctrl-O`: open Codex
- `Ctrl-Y`: open Cline
- `Ctrl-R`: run `bga sync`
- `Ctrl-B`: run `bga recent`
- `Ctrl-T`: open worktree picker in tmux mode

If you use `delta`, lazygit diffs become much easier to scan. The config already prefers it when available.

If you already have your own lazygit config and do not want a blind overwrite, use:

```bash
git lazygit-config backup
git lazygit-config diff
git lazygit-config merge-hint
```

### 4.1 Lazygit daily routine

For normal day-to-day work, this is the simplest pattern:

```bash
git lg
```

Then work in this order:

1. Review changed files in the left file panel
2. Stage only the files or hunks you want
3. Open the diff panel to verify the final patch
4. Commit from inside lazygit
5. Push only after the diff looks clean

This reduces the common mistake of committing extra debug edits or unrelated files.

### 4.2 Staging workflow

Use lazygit when you need more control than `git add .`.

Good cases:

- one file contains both real changes and temporary debug code
- you edited several files but only want to commit part of them
- you want to inspect the patch before staging

Practical pattern:

1. Open `git lg`
2. Move through changed files
3. Stage intentionally instead of staging everything
4. Check the staged diff again before committing

This pairs well with the worktree model: each feature has its own directory, and inside that directory lazygit helps you keep commits small.

### 4.3 Review before commit

The right way to use lazygit is not just "open it and commit". Use it as a review checkpoint.

Before every commit:

1. Scan the file list
2. Read the full diff
3. Confirm there are no accidental snapshots, logs, secrets, or formatting noise
4. Make sure the commit only contains one idea

If the patch feels mixed, split it before you commit.

### 4.4 Branch switching and recent work

Inside lazygit, use the custom shortcuts when you need to move quickly:

- `Ctrl-B`: open recent branch picker via `bga recent`
- `Ctrl-R`: fetch and rebase current branch via `bga sync`

This is useful when you are reviewing something on one branch and need to jump back to another branch without leaving your Git UI flow.

### 4.5 Stash workflow without chaos

If you still need stash occasionally, lazygit is a better place to manage it than raw CLI.

Use stash when:

- you are in the main worktree and need to park a quick experiment
- you are doing a small spike that does not deserve its own branch yet

Avoid stash when:

- you are actively working on multiple real features
- the work will continue for more than a short interruption

In those cases, create another worktree instead:

```bash
git feature start another-task
```

The rule of thumb is simple:

- short interruption: stash can be fine
- real parallel work: use worktrees

### 4.6 Multi-worktree review flow

When you are handling several active features:

```bash
git wt list
git wttmux
```

Then, inside the selected tmux session, run:

```bash
git lg
```

Or use the lazygit shortcut:

- `Ctrl-T`: open worktree picker in tmux mode

This gives you a stable pattern:

1. one worktree per feature
2. one tmux session per worktree
3. one lazygit view per worktree

That is much easier to manage than constantly switching branches in one directory.

### 4.7 AI-assisted lazygit workflow

This is where the integration becomes unusually useful.

From inside lazygit:

- `Ctrl-O`: open Codex in the current repo/worktree
- `Ctrl-Y`: open Cline in the current repo/worktree
- `Ctrl-W`: open the full tmux cockpit

Practical use:

1. inspect a diff in lazygit
2. notice a refactor or fix is still needed
3. open Codex or Cline in the same worktree
4. make the change
5. return to lazygit and review the updated patch

Because the AI CLI launches inside the same worktree, file context stays aligned with the exact feature you are working on.

### 4.8 Suggested habits

If you want this setup to actually improve speed, keep these habits:

1. Use worktrees for parallel features, not stash
2. Use lazygit to review before every commit
3. Keep commits small and focused
4. Use `git dash` or `git menu` when you lose track
5. Use tmux cockpit only for features that are active enough to deserve persistent context

The point is not to live inside tools. The point is to reduce context loss and make good Git behavior easier than messy Git behavior.

### 5. Use Codex or Cline per worktree

If you are handling parallel features, keep one AI session per worktree:

```bash
git codex billing
git cline onboarding
```

Or open a tmux cockpit:

```bash
git cockpit billing
```

Suggested pattern:

- one worktree per feature
- one tmux session per worktree
- one AI CLI per session when needed

This keeps prompts and local file context isolated by feature.

Available cockpit layouts:

- `solo`: shell + git + optional AI window
- `review`: shell + git + log + status
- `ai-pair`: shell + git + AI + notes
- `multi-feature`: shell + git + worktrees + status + optional AI

Example:

```bash
git cockpit billing --layout review
```

### 5.5 Use tmux as the control plane

For heavier work, prefer tmux over many loose terminal tabs:

```bash
git cockpit billing
```

This gives you one place per feature. A practical pattern is:

- shell window for edits/tests
- git window for `lazygit`
- AI window for `codex` or `cline`

If you are mid-review and need to jump elsewhere without losing context, detach tmux and come back later.

If you want a layout specialized for review or multiple active branches:

```bash
git cockpit billing --layout review
git cockpit --layout multi-feature
```

### 6. Daily maintenance

At the start of work:

```bash
git sync
git dash
```

The newer `git dash` is opinionated on purpose. It tries to answer:

- what needs attention right now
- which worktrees are dirty
- which managed worktrees are stale
- whether the current branch is ahead/behind or missing an upstream

When you need another branch quickly:

```bash
git recent
```

With `fzf`, this shows recent branch metadata and a log preview before checkout.

When old branches pile up:

```bash
git prune-merged
```

When a feature is done and its worktree is no longer needed:

```bash
git wtrm
```

If you want a safer cleanup pass for managed worktrees:

```bash
git wt stale
git wt clean
git wt clean --apply
```

And if a feature branch is already merged into your base branch:

```bash
git feature finish my-feature --base main
```

This tries to:

- remove managed worktrees for that branch
- skip the current worktree
- skip unmanaged paths
- delete the local branch if it is no longer checked out anywhere

With `fzf`, worktree selection shows:

- branch name
- path
- `git status -sb`
- recent commits
- a short file list

## Recommended workflow patterns

### Simple solo workflow

```bash
git sync
git feature start search-redesign
gwt search-redesign
git lg
```

### Multi-feature workflow

```bash
git feature start checkout-a11y
git feature start pricing-copy
git feature start api-timeout-fix
git wt list
git wttmux
```

Cleanup pattern after merge:

```bash
git wt stale
git wt clean --apply
git prune-merged
```

### AI-assisted workflow

```bash
git doctor
git feature start reporting-export
git cockpit reporting-export
```

Inside tmux:

- shell window for coding/tests
- git window for `lazygit` or `git status`
- AI window for `codex` or `cline`

## Notes

- `git worktree remove` requires the worktree to be clean unless you force-remove it manually.
- `git sync` only rebases if the current branch already has an upstream.
- New worktrees are stored outside the repo root on purpose, so each feature has a stable path and does not clutter the main working tree.
- `git bootstrap apt` uses `sudo apt-get`; that is intentional because dependency installation is a system-level action.
- `install.sh` currently overwrites the lazygit config at `~/.config/lazygit/config.yml`. If you already maintain a custom config, merge it first.

## Why this setup is practical

The highest-leverage improvement for most people is not another 50 aliases. It is this:

- discoverable commands
- fast branch/worktree picking
- reliable multi-feature context switching
- optional visual tools when you want them
- optional AI/tmux integration when you need more throughput

That is what this repo is optimized for.

## Release metadata

- Version: [VERSION](VERSION)
- Changelog: [CHANGELOG.md](CHANGELOG.md)
- License: [LICENSE](LICENSE)
