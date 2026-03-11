#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
CONFIG_DIR="${HOME}/.config/better-git-aliases"
TARGET_BIN="${BIN_DIR}/bga"
TARGET_INCLUDE="${CONFIG_DIR}/gitconfig.include"
LAZYGIT_DIR="${HOME}/.config/lazygit"
TARGET_LAZYGIT_CONFIG="${LAZYGIT_DIR}/config.yml"
TARGET_LAZYGIT_TEMPLATE="${CONFIG_DIR}/lazygit/template.yml"
TARGET_SHELL_HELPER="${CONFIG_DIR}/shell/bga.sh"

mkdir -p "$BIN_DIR" "$CONFIG_DIR" "$LAZYGIT_DIR" "${CONFIG_DIR}/lazygit" "${CONFIG_DIR}/shell"
install -m 0755 "${ROOT_DIR}/bin/bga" "$TARGET_BIN"
install -m 0644 "${ROOT_DIR}/config/gitconfig.include" "$TARGET_INCLUDE"
install -m 0644 "${ROOT_DIR}/config/lazygit/config.yml" "$TARGET_LAZYGIT_CONFIG"
install -m 0644 "${ROOT_DIR}/config/lazygit/config.yml" "$TARGET_LAZYGIT_TEMPLATE"
install -m 0644 "${ROOT_DIR}/shell/bga.sh" "$TARGET_SHELL_HELPER"

if ! git config --global --get-all include.path | grep -Fxq "$TARGET_INCLUDE"; then
  git config --global --add include.path "$TARGET_INCLUDE"
fi

cat <<EOF
Installed:
  ${TARGET_BIN}
  ${TARGET_INCLUDE}
  ${TARGET_LAZYGIT_CONFIG}
  ${TARGET_LAZYGIT_TEMPLATE}
  ${TARGET_SHELL_HELPER}

Next:
  1. Ensure ~/.local/bin is in PATH
  2. Run: git doctor
  3. Run: git workflow-help
  4. Optional shell integration:
     echo 'source "${TARGET_SHELL_HELPER}"' >> ~/.bashrc
EOF
