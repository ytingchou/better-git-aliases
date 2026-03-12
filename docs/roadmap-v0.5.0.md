# v0.5.0 roadmap

This roadmap focuses on the next version after `v0.4.2`.

The project is now in a stronger place:

- daily feature workflows are solid
- workspace workflows exist
- repo-level defaults exist
- release ergonomics are no longer fully manual

The next version should avoid random feature growth.
It should push one clear theme:

- host-aware, but still host-agnostic by default

## Theme

`v0.5.0` should improve how the toolkit understands Git remotes without turning the core workflow into a hosting-platform wrapper.

That means:

- detect more providers safely
- expose useful host-neutral remote actions
- keep PR/MR creation optional, not central

## Priority 1

### 1. Remote actions

Goal:

- make the current remote more useful without assuming GitHub

Candidates:

- `git remote-info`
- `git remote-open`
- `git remote-browse`

Why:

- remote parsing already exists
- the next step is acting on that information safely

### 2. Better provider detection

Goal:

- improve coverage for Azure DevOps, GitLab, Gitea, and generic self-hosted remotes

Candidates:

- normalize SSH and HTTPS URL patterns
- document supported formats
- avoid provider-specific breakage when URLs are unusual

Why:

- remote parsing is only useful if it is dependable

## Priority 2

### 3. Optional compare URL helpers

Goal:

- offer review shortcuts for supported hosts without making them part of the core workflow

Candidates:

- `git remote-compare`
- only for providers with safe URL patterns
- graceful fallback to plain repo URL when compare URLs are unclear

Why:

- useful, but should stay optional

### 4. Docs and onboarding polish

Goal:

- make new capabilities easier to discover

Candidates:

- remote workflow section in README
- Azure DevOps examples
- more multi-repo examples

Why:

- host-aware features need documentation to feel trustworthy

## Not in v0.5.0

- API integrations
- auth flows
- auto-creating PRs or MRs
- provider-specific state queries

These are higher-risk and should only come after the remote parsing layer proves stable.
