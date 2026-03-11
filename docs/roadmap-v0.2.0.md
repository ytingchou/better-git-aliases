# v0.2.0 roadmap

This roadmap focuses on the next set of improvements that can make `better-git-aliases` more useful in real daily engineering work.

The goal is not to add more aliases for the sake of it.

The goal is to improve:

- day-to-day speed
- clarity of workflow
- safer multi-feature work
- onboarding for users who are not Git power users yet

## Release theme

`v0.2.0` should make the toolkit feel more complete as a daily driver.

That means:

1. better task-oriented workflows
2. stronger setup and validation
3. smoother tmux and lazygit integration
4. fewer rough edges for normal users

## Priority 1

### 1. Smarter tmux cockpit layouts

Current state:

- `git cockpit` opens a useful session
- the session is helpful, but still basic

What to add:

- named layouts such as `solo`, `review`, `ai-pair`, `multi-feature`
- session naming rules that are easier to predict
- optional restoration behavior when reopening the same feature workspace

Why it matters:

- tmux is most valuable when reopening work is frictionless
- users doing parallel features need stable terminal context

Expected outcome:

- `git cockpit` becomes a real daily entrypoint, not just a convenience wrapper

### 2. Better lazygit setup and optional config merge flow

Current state:

- the repo installs a curated lazygit config
- it works, but users with their own config may want a safer merge path

What to add:

- `bga lazygit-config diff`
- `bga lazygit-config backup`
- `bga lazygit-config merge-hint`

Why it matters:

- users are more willing to adopt the toolkit if it respects existing setup
- safer config handling reduces fear of installation

Expected outcome:

- easier adoption for users who already use lazygit

### 3. Worktree lifecycle helpers

Current state:

- worktree creation and removal are already covered

What to add:

- `git feature finish`
- `git wt clean`
- `git wt stale`

Possible behavior:

- detect merged branches
- list stale worktrees
- guide the user through cleanup

Why it matters:

- multi-worktree workflows get messy if cleanup is manual

Expected outcome:

- easier long-term use for people managing many tasks in parallel

## Priority 2

### 4. Setup doctor with stronger checks

Current state:

- `git doctor` checks tool presence and basic file installation

What to add:

- check whether `~/.local/bin` is in `PATH`
- check whether shell integration is active
- check whether `fzf` key tooling is actually usable
- clearer actionable remediation messages

Why it matters:

- setup friction is one of the biggest reasons users abandon CLI tooling

Expected outcome:

- faster successful first-run experience

### 5. Guided menu actions for beginners

Current state:

- `git menu` is useful, but still assumes some confidence

What to add:

- simple prompts for feature creation
- guided cleanup choices
- task-oriented labels like:
  - `Start a new feature`
  - `Resume existing feature`
  - `Review and commit changes`

Why it matters:

- new users think in tasks, not command names

Expected outcome:

- lower learning curve

### 6. More opinionated daily status view

Current state:

- `git dash` shows useful information

What to add:

- highlight dirty worktrees
- show upstream ahead/behind for key branches
- show "what probably needs attention now"

Why it matters:

- people often lose time simply figuring out where they left off

Expected outcome:

- faster context recovery

## Priority 3

### 7. GitHub-friendly workflow helpers

What to add:

- open current repo PR page
- open compare page for current branch
- show branch publish status more clearly

Why it matters:

- many users move between CLI and GitHub constantly

Expected outcome:

- less context switching friction

### 8. Demo assets and polished release presentation

Current state:

- docs structure exists
- screenshots are planned but not yet included

What to add:

- real screenshots
- short demo gifs
- cleaner GitHub project presentation

Why it matters:

- presentation strongly affects adoption

Expected outcome:

- easier onboarding from the repo homepage

## Not a priority for v0.2.0

These are intentionally lower priority:

- dozens of extra aliases
- heavy framework-specific integrations
- large plugin systems
- complicated installation logic for every operating system

Those can wait. The toolkit still gets more value from workflow polish than from feature count.

## Suggested release scope

If `v0.2.0` should stay focused, this is the best scope:

1. smarter tmux cockpit layouts
2. safer lazygit config management
3. worktree lifecycle helpers
4. stronger `git doctor`
5. a more guided `git menu`

That would be a meaningful release without turning the repo into a bloated toolbox.
