# v0.6.0 roadmap

This roadmap covers the next version after `v0.5.0`.

The project now has:

- stable daily workflows
- workspace workflows
- repo-level conventions
- release ergonomics
- the first host-aware remote actions

The next version should build on that without turning the project into a hosting-platform abstraction mess.

## Theme

`v0.6.0` should improve host-aware review context while keeping the main workflow platform-neutral.

That means:

- better remote summaries
- better optional compare/review helpers
- clearer documentation around provider capability levels

## Priority 1

### 1. Remote status

Goal:

- show the current branch, base branch, provider, and remote action readiness in one place

Candidates:

- `git remote-status`
- compare support hints
- clear fallback guidance for unsupported providers

Why:

- users need to know what remote actions are actually safe on the current repo

### 2. Provider capability matrix

Goal:

- document what each provider currently supports

Candidates:

- GitHub: info, open, compare
- GitLab: info, open, compare
- Azure DevOps: info, open, safe fallback for compare
- generic: info, open, safe fallback for compare

Why:

- explicit limits make optional features more trustworthy

## Priority 2

### 3. Remote menu entry

Goal:

- make provider-aware actions discoverable from `git menu`

Candidates:

- `Remote status`
- `Open remote repo`
- `Open remote compare`

Why:

- remote tooling should be easy to find without memorization

### 4. Docs polish

Goal:

- explain host-aware actions with examples

Candidates:

- Azure DevOps example workflows
- supported remote URL examples
- compare fallback examples

Why:

- provider behavior needs explicit examples

## Not in v0.6.0

- automatic PR/MR creation
- hosting provider APIs
- auth flows
- issue linking

Those belong later, if ever.
