# Dotfiles

Included a configuration files for Vim, tmux, git and Atom.

Symlink the config files to your home directory.

Run `atom-install.sh` to install the base Atom packages.

Run `atom-install-theme.sh` to install selected themes. *Note - You may need to select and configure the themes after installation.*

# Fira Code
Install (Fira Code Font)[https://github.com/tonsky/FiraCode] for arrows, binds, and other symbols.

Installation will depend on your OS.

# Atom
## Eol-enforcer 
This package will force Atom to open files according to the line ending setting found in the `line-ending-selector` in core package. This is useful when opening files in Windows with Unix-style line endings or vice versa.

## Linter-stylelint
Check the `use standard` checkbox in the package's setttings. This will use the `styelint-config-standard` rules when linting style sheets.

# Vim
.vimrc depends on neocomplete which requires Vim 7.4+ and lua scripting. Use homebrew or an installation package to download Vim.
.vimrc also uses Vundle for package manaagement. Install this first before running `:PluginInstall` in Vim.

# Tmux
homebrew it. Then install Tmux package manager (tpm).

## .vimrc & .tmux.conf
These configs are a bit of a mess so use with caution.

# Git
home brew bash-completion and bash-git-prompt. 

Add to your .bash_profile 
```
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
```
