# roadmap-portfolio

This document groups the project roadmap into a small number of long-lived tracks.

The point is not to promise every feature.
The point is to keep the project from turning into an unstructured pile of aliases.

## Portfolio

### 1. Workspace intelligence

Goal:

- make multi-repo work feel as coherent as single-repo work

Typical scope:

- workspace attention signals
- sorting and prioritization in workspace views
- recent repo picking
- cross-repo stale/dirty summaries

Why it matters:

- many real users do not live in one repo all day

### 2. Team config layer

Goal:

- let repos define conventions without forcing every developer to hand-tune local config

Typical scope:

- branch naming conventions
- default feature prefixes
- protected branch policies
- team validation helpers

Why it matters:

- this is how a personal workflow tool becomes a team tool

### 3. Remote review layer

Goal:

- provide host-aware review context without making provider-specific helpers the center of the project

Typical scope:

- remote status
- remote compare
- provider capability hints
- safe fallbacks for unsupported hosts

Why it matters:

- users need lightweight hosting awareness, especially across GitHub, GitLab, and Azure DevOps

### 4. Safer cleanup system

Goal:

- make cleanup commands more trustworthy and explainable

Typical scope:

- full dry-run consistency
- cleanup reasoning
- policy configuration
- machine-readable cleanup output

Why it matters:

- destructive commands only scale when users trust them

### 5. Documentation and adoption

Goal:

- make the project easier to evaluate, adopt, and recommend

Typical scope:

- screenshots
- gifs
- team onboarding
- provider-specific examples

Why it matters:

- the project is now broad enough that presentation affects adoption

### 6. Optional provider modules

Goal:

- add deeper provider-specific helpers without polluting the core workflow

Typical scope:

- Azure DevOps compare helpers
- GitLab/Gitea refinements
- optional PR/MR URL helpers

Why it matters:

- some users want deeper integration, but that should stay optional

## Suggested order

### Now

- workspace intelligence
- team config layer

### Next

- remote review layer
- safer cleanup system

### Later

- documentation and adoption
- optional provider modules

## Why this order

- workspace and team features extend the strongest existing parts of the project
- remote/provider features are useful, but should stay bounded
- documentation becomes much easier once the feature surface stabilizes
