# dotfiles

Hello! These are my personal dotfiles. They're full of both functional and aesthetic
choices that I personally prefer to work with. These include colorschemes, plugins, and
other additions.

## bashrc

My `.bashrc` is a fork of a friend/colleagues, that has been modified over time to include
and disclude things to my liking. Specifically, this file includes but is not limited to:

* powerline configuration (tweaking for local directory needed if downloaded)
* PS1 configuration if powerline is unavailable
* Tilix (my preferred terminal) configuration
* A couple of standard aliases
* base16-shell support (turned off by default)

## vimrc

My `.vimrc` is a fork of a friend/colleagues, that has been modified over time to include
and disclude things to my liking. Specifically, this file includes but is not limited to:

* Plugin configurations
* Minor tweaks to the UI and behavior of vim
* Dracula colorscheme configuration
* Powerline configuration

## tmux

My `.tmux.conf` is of my own design, which includes:

* Custom hotkeys
* Custom plugins
* Powerline configuration
* Mouse support

## Powerline config files!

These are made to be merged with the `~/.config/powerline` directory to work properly. All
I've done is use the default and solarized themes as a base to implement my own custom
dracula-style theme for powerline in bash, vim, and tmux. Most of the code in these files
is from the original powerline developers [here](https://github.com/powerline/powerline).
All credit goes to them for their hard work.

## Other Notes

These dotfiles were written to work in a native Linux environment with a Tilix terminal
as the terminal of choice. They've been tested to work well in WSLtty (WSL mintty port)
as well, so if there are issues for anybody using these, I can't guarantee they'll work
for you in other different environments. They may need some tweaking.

## Setup

Want to use these?

* Copy `.bashrc` to your home directory. Make sure to specify the powerline directory,
or turn it off for the regular PS1 prompt
* Copy `.vimrc` and `.tmux.conf` too
* Install [powerline](https://github.com/powerline/powerline)
* Copy the powerline config files from the powerline git folder to `~/.config/powerline`
* Copy my config files in as well, overwrite any existing files

## Disclaimer

These config files may eventually become deprecated as the software used by them will
likely change over time. If this happens, *I cannot guarantee I will still be maintaining
them for personal use.* If that is the case, I will likely also not update them here.

In This case, they may be used as reference regardless.