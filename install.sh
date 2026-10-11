#!/usr/bin/env bash
# Symlink (default) or copy dotfiles into $HOME. Backs up existing files first.
set -euo pipefail
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:---link}"
BACKUP="$HOME/.dotfiles.bak-$(date +%Y%m%d-%H%M%S)"

link_or_copy() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ "$(readlink -f "$dest")" != "$src" ]; then
    mkdir -p "$BACKUP"
    echo "backup: $dest -> $BACKUP/"
    mv "$dest" "$BACKUP"/
  fi
  if [ "$MODE" = "--copy" ]; then
    cp -p "$src" "$dest"
    echo "copied: $dest"
  else
    ln -sfn "$src" "$dest"
    echo "linked: $dest -> $src"
  fi
}

export_dotfiles() {
  # find all files except .git, README, install.sh, .gitignore
  while IFS= read -r -d '' f; do
    rel="${f#$DOTFILES_DIR/}"
    link_or_copy "$f" "$HOME/$rel"
  done < <(find "$DOTFILES_DIR" \( -type f -o -type l \) \
    -not -path "$DOTFILES_DIR/.git/*" \
    -not -name "README.md" -not -name "install.sh" -not -name ".gitignore" -print0)
}

case "$MODE" in
  --link|--copy) ;;
  *) echo "usage: ./install.sh [--link|--copy]"; exit 1;;
esac

export_dotfiles
echo "done (mode=$MODE). backups in $BACKUP (if any)."
