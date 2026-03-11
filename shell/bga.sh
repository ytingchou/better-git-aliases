#!/usr/bin/env bash

if [ -n "${BGA_SHELL_LOADED:-}" ]; then
  return 0
fi
export BGA_SHELL_LOADED=1

_bga_repo_bin() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
  if [ -x "${script_dir}/bin/bga" ]; then
    printf '%s/bin/bga\n' "$script_dir"
  elif [ -x "${HOME}/.local/bin/bga" ]; then
    printf '%s/.local/bin/bga\n' "$HOME"
  else
    printf '%s/bin/bga\n' "$script_dir"
  fi
}

gwt() {
  local target
  target="$("$(_bga_repo_bin)" worktree path "${1:-}")" || return $?
  [ -n "$target" ] || return 0
  cd "$target" || return $?
}

gmenu() {
  "$(_bga_repo_bin)" menu "$@"
}

gcockpit() {
  "$(_bga_repo_bin)" cockpit "$@"
}

gdoctor() {
  "$(_bga_repo_bin)" doctor "$@"
}

fresume() {
  local target
  target="$("$(_bga_repo_bin)" feature resume "${1:-}" --print)" || return $?
  [ -n "$target" ] || return 0
  cd "$target" || return $?
}

gcodex() {
  local target="."
  if [ $# -gt 0 ]; then
    target="$("$(_bga_repo_bin)" worktree path "$1")" || return $?
  fi
  cd "$target" || return $?
  codex
}

gcline() {
  local target="."
  if [ $# -gt 0 ]; then
    target="$("$(_bga_repo_bin)" worktree path "$1")" || return $?
  fi
  cd "$target" || return $?
  cline
}
