# provider-capabilities

This document explains what the remote-aware commands currently support.

The project direction stays the same:

- keep the core workflow Git-native
- make provider-aware actions optional
- prefer safe fallback over clever but brittle behavior

## Capability matrix

| Provider | `remote-info` | `remote-open` | `remote-status` | `remote-compare` |
| --- | --- | --- | --- | --- |
| GitHub | yes | yes | yes | yes |
| GitLab | yes | yes | yes | yes |
| Azure DevOps | yes | yes | yes | fallback to repo URL |
| Generic host | yes | yes | yes | fallback to repo URL |

## What "fallback to repo URL" means

For some providers, the project intentionally does not guess a compare URL yet.

When that happens:

- `remote-status` says compare is `fallback only`
- `remote-compare` prints the repo URL and tells you to compare manually

This is deliberate.
It is better than emitting a broken provider-specific URL.

## Supported remote URL styles

### GitHub

- `git@github.com:owner/repo.git`
- `https://github.com/owner/repo.git`
- `ssh://git@github.com/owner/repo.git`

### GitLab

- `git@gitlab.com:group/repo.git`
- `https://gitlab.com/group/repo.git`

### Azure DevOps

- `https://dev.azure.com/org/project/_git/repo`
- `git@ssh.dev.azure.com:v3/org/project/repo`
- `git@vs-ssh.visualstudio.com:v3/org/project/repo`

## Why Azure compare still falls back

Azure DevOps has more URL variants than GitHub and GitLab, especially across older and newer formats.

The project currently prefers:

- correct repo detection
- correct repo opening
- clear fallback messaging

before adding provider-specific compare helpers.

## Recommended usage

If you are unsure what the current repo supports:

```bash
git remote-status
git remote-info
```

If compare support is available:

```bash
git remote-compare
```

If compare support is not available yet:

```bash
git remote-open
```
