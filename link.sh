#!/usr/bin/env sh
 
DOTFILES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
 
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Error: dotfiles directory not found at $DOTFILES_DIR"
  exit 1
fi
 
linked=0
skipped=0
 
for src in "$DOTFILES_DIR"/*/; do
  # Strip trailing slash to get the folder name
  src="${src%/}"
  name="${src##*/}"
  dest="$CONFIG_DIR/$name"
 
  # Skip if it's already correctly symlinked
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  [skip] $name (already symlinked)"
    skipped=$((skipped + 1))
    continue
  fi
 
  # Remove existing file, dir, or stale symlink
  if [ -L "$dest" ] || [ -e "$dest" ]; then
    rm -rf "$dest"
    echo "  [removed] existing $name"
  fi
 
  ln -s "$src" "$dest"
  echo "  [linked] $name -> $src"
  linked=$((linked + 1))
done
 
echo ""
echo "Done. $linked linked, $skipped already up to date."