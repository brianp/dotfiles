#!/bin/sh

for name in *; do
  target="$HOME/.$name"

  if [ -f $target ]; then
    echo "Skipping $target it already exists"
    continue
  fi

  if [ $name != 'install.sh' ]; then
    echo "Creating $target"
    ln -sn "$PWD/$name" "$target"
  fi
done
