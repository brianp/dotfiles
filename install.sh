#!/bin/sh

for name in *; do
  target="$HOME/.$name"

  if [ $name != 'install.sh' ]; then
    echo "Creating $target"
    ln -sn "$PWD/$name" "$target" --force
  fi
done
