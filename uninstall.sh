#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
CONFIG_DIR="${HOME}/.config/better-git-aliases"
LAZYGIT_DIR="${HOME}/.config/lazygit"

TARGET_BIN="${BIN_DIR}/bga"
TARGET_INCLUDE="${CONFIG_DIR}/gitconfig.include"
TARGET_LAZYGIT_TEMPLATE="${CONFIG_DIR}/lazygit/template.yml"
TARGET_SHELL_HELPER="${CONFIG_DIR}/shell/bga.sh"
TARGET_LAZYGIT_CONFIG="${LAZYGIT_DIR}/config.yml"

remove_if_exists() {
  local path="$1"
  if [ -e "$path" ]; then
    rm -f "$path"
    printf 'Removed: %s\n' "$path"
  else
    printf 'Skip: %s (not found)\n' "$path"
  fi
}

remove_dir_if_empty() {
  local path="$1"
  if [ -d "$path" ] && [ -z "$(find "$path" -mindepth 1 -maxdepth 1 2>/dev/null)" ]; then
    rmdir "$path"
    printf 'Removed empty dir: %s\n' "$path"
  fi
}

remove_git_include() {
  local include_path="$1"
  while git config --global --get-all include.path 2>/dev/null | grep -Fqx "$include_path"; do
    git config --global --unset-all include.path "$include_path"
  done
  printf 'Removed git include: %s\n' "$include_path"
}

remove_lazygit_config_if_managed() {
  if [ ! -f "$TARGET_LAZYGIT_CONFIG" ]; then
    printf 'Skip: %s (not found)\n' "$TARGET_LAZYGIT_CONFIG"
    return 0
  fi

  if [ -f "$TARGET_LAZYGIT_TEMPLATE" ] && cmp -s "$TARGET_LAZYGIT_TEMPLATE" "$TARGET_LAZYGIT_CONFIG"; then
    remove_if_exists "$TARGET_LAZYGIT_CONFIG"
  else
    printf 'Keep: %s (content differs from installed template)\n' "$TARGET_LAZYGIT_CONFIG"
  fi
}

main() {
  remove_if_exists "$TARGET_BIN"
  remove_if_exists "$TARGET_INCLUDE"
  remove_if_exists "$TARGET_SHELL_HELPER"
  remove_lazygit_config_if_managed
  remove_if_exists "$TARGET_LAZYGIT_TEMPLATE"

  remove_git_include "$TARGET_INCLUDE"

  remove_dir_if_empty "${CONFIG_DIR}/lazygit"
  remove_dir_if_empty "${CONFIG_DIR}/shell"
  remove_dir_if_empty "$CONFIG_DIR"
  remove_dir_if_empty "$LAZYGIT_DIR"
  remove_dir_if_empty "${HOME}/.config"
  remove_dir_if_empty "$BIN_DIR"
  remove_dir_if_empty "${HOME}/.local"

  cat <<EOF
Uninstall complete.

Manual follow-up if needed:
  - remove any 'source "${TARGET_SHELL_HELPER}"' line from your shell rc
  - restore your own ~/.config/lazygit/config.yml if you had one before install
EOF
}

main "$@"
