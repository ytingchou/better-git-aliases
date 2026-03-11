# roadmap-next

This roadmap tracks the next round of practical improvements after `v0.2.0`.

The project direction is now clearer:

- keep the main workflow platform-agnostic
- optimize for real daily usage
- prefer complete workflow actions over more tiny aliases

## Done

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

### 4. Repo/workspace overview

Goal:

- scale from one repo to several active repos

Delivered:

- `bga workspace list`
- `bga workspace dash`
- `bga workspace sync`
- `workspace_root` config override

Why it mattered:

- many engineers juggle multiple repos during the same day

### 5. Config layer

Goal:

- make behavior easier to tune without editing scripts

Delivered:

- default base branch override
- preferred remote override
- preferred cockpit layout
- workspace root override

Why it mattered:

- current defaults are good, but teams eventually want their own conventions

## Next
### 6. Team conventions

Goal:

- let a repo or team share a few workflow defaults without everyone hand-tuning local config

Possible additions:

- repo-level `.bga.env` or `.bga.config`
- default base branch
- preferred remote
- preferred cockpit layout
- optional protected branch list

Why:

- local config is useful, but team conventions should not depend on tribal knowledge

### 7. Workspace action menu

Goal:

- make multi-repo work feel as guided as the single-repo menu

Possible additions:

- `bga workspace menu`
- pick repo then action
- workspace-level recent repo picker

Why:

- once users manage several repos, discoverability matters again

## Later

### 8. Provider abstraction

Goal:

- support forge-specific helpers beyond GitHub without polluting the main workflow

Possible additions:

- optional provider modules
- Azure DevOps / GitLab / Gitea support

Why:

- useful, but not required for the main Git-native workflow

### 9. Demo polish

Goal:

- improve adoption from the repo homepage

Possible additions:

- screenshots
- gifs
- richer examples

Why:

- presentation matters, but workflow quality comes first
