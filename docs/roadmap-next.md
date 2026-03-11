# roadmap-next

This roadmap tracks the next round of practical improvements after `v0.2.0`.

The project direction is now clearer:

- keep the main workflow platform-agnostic
- optimize for real daily usage
- prefer complete workflow actions over more tiny aliases

## Now

### 1. Feature resume flow

Goal:

- make it explicit how to resume the current or most relevant feature

Possible additions:

- `git feature resume`
- choose by branch or worktree
- optionally jump path, open lazygit, or open cockpit

Why:

- users should not need to remember whether to use `gwt`, `git wt path`, or the menu

### 2. Feature pause / handoff summary

Goal:

- make it easy to stop work cleanly and come back later

Possible additions:

- `git feature pause`
- show branch, dirty state, recent commits, and next-step note template

Why:

- context loss is a real productivity tax

### 3. Review workflow

Goal:

- create one focused review entrypoint before pushing or opening a PR/MR

Possible additions:

- `git review`
- `git review diff`
- `git review status`

Why:

- review quality matters more than alias count

## Next

### 4. Repo/workspace overview

Goal:

- scale from one repo to several active repos

Possible additions:

- `bga workspace dash`
- `bga workspace sync`
- `bga workspace list`

Why:

- many engineers juggle multiple repos during the same day

### 5. Config layer

Goal:

- make behavior easier to tune without editing scripts

Possible additions:

- default base branch override
- preferred remote override
- preferred cockpit layout

Why:

- current defaults are good, but teams eventually want their own conventions

## Later

### 6. Provider abstraction

Goal:

- support forge-specific helpers beyond GitHub without polluting the main workflow

Possible additions:

- optional provider modules
- Azure DevOps / GitLab / Gitea support

Why:

- useful, but not required for the main Git-native workflow

### 7. Demo polish

Goal:

- improve adoption from the repo homepage

Possible additions:

- screenshots
- gifs
- richer examples

Why:

- presentation matters, but workflow quality comes first
