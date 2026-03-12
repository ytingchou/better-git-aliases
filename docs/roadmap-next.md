# roadmap-next

This document tracks the practical short-term queue after `v0.5.1`.

The long-term portfolio view lives in [roadmap-portfolio.md](roadmap-portfolio.md).

## Done

### Daily flow

Delivered:

- `feature resume`
- `feature pause`
- `review`
- `feature submit`
- `feature cleanup`
- `start-day`
- `finish-day`

Why it mattered:

- the project became a workflow toolkit instead of a loose alias bundle

### Worktree and workspace

Delivered:

- `workspace list`
- `workspace dash`
- `workspace sync`
- `workspace menu`
- tmux cockpit layouts
- stale worktree cleanup helpers

Why it mattered:

- parallel feature work and multi-repo work both became first-class

### Config and team defaults

Delivered:

- `config-bga`
- repo-level `.bga.env`
- protected branch config
- workspace root override

Why it mattered:

- local flexibility and shared conventions now coexist cleanly

### Release ergonomics

Delivered:

- `release-check`
- `release-init`
- consistent release note flow

Why it mattered:

- frequent releases are now low-friction

### Host-aware remote actions

Delivered:

- `remote-info`
- `remote-open`
- `remote-status`
- `remote-compare`
- remote actions in `git menu`
- provider capability documentation

Why it mattered:

- the project gained useful hosting awareness without making it central

## Now

### 1. Workspace intelligence

Goal:

- make workspace views prioritize what actually needs attention

Delivered so far:

- workspace attention summary
- dirty-first sorting
- no-upstream and ahead/behind prioritization
- recent repo entrypoint

Still open:

- workspace stale branch summary
- richer multi-repo attention grouping

Why:

- the current workspace tools are useful, but still mostly descriptive

### 2. Team config validation

Goal:

- help teams verify that repo defaults and local overrides are coherent

Candidates:

- `config-bga validate`
- branch naming policy checks
- protected branch config validation

Why:

- team config becomes more valuable once it can be validated

## Next

### 3. Safer cleanup reports

Goal:

- make destructive operations more explainable

Candidates:

- richer dry-run output
- explicit cleanup reasons
- optional machine-readable output

Why:

- trust matters most when commands delete things

### 4. Remote review polish

Goal:

- improve remote-aware review context while keeping provider actions optional

Candidates:

- provider capability hints in `remote-status`
- clearer compare fallback guidance
- more self-hosted pattern coverage

Why:

- the base layer exists; now it needs polish

## Later

### 5. Documentation and adoption assets

Goal:

- make the project easier to evaluate quickly

Candidates:

- screenshots
- gifs
- deeper onboarding examples

Why:

- presentation matters more now that the feature surface is broader

### 6. Optional provider modules

Goal:

- support deeper provider-specific flows without touching the core workflow

Candidates:

- Azure DevOps compare improvements
- GitLab/Gitea refinements
- optional PR/MR URL helpers

Why:

- useful for some users, but still not the core of the project
