if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
if [ -e /Users/brianp/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/brianp/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
