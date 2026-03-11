#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-$(pwd)/tmp/bga-demo-workspace}"

create_repo() {
  local path="$1" name="$2"
  mkdir -p "$path"
  git -C "$path" init -b main >/dev/null
  git -C "$path" config user.name "bga demo"
  git -C "$path" config user.email "demo@example.com"
  printf '# %s\n' "$name" >"$path/README.md"
  git -C "$path" add README.md
  git -C "$path" commit -m "chore: initial commit" >/dev/null
}

mkdir -p "$ROOT"

create_repo "$ROOT/storefront-web" "storefront-web"
create_repo "$ROOT/storefront-api" "storefront-api"

cat >"$ROOT/storefront-web/.bga.env" <<'EOF'
base_branch=main
cockpit_layout=review
protected_branches=main,develop,release
EOF

git -C "$ROOT/storefront-web" checkout -b develop >/dev/null
git -C "$ROOT/storefront-web" checkout main >/dev/null
git -C "$ROOT/storefront-api" checkout -b feature/cart-panel >/dev/null

cat <<EOF
Created demo workspace:
  $ROOT

Repos:
  $ROOT/storefront-web
  $ROOT/storefront-api

Try:
  cd "$ROOT/storefront-web"
  git config-bga set workspace_root "$ROOT"
  git wsdash
  git wsmenu
  git config-bga list

Repo defaults in storefront-web:
  $ROOT/storefront-web/.bga.env
EOF
