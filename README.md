![](https://source.unsplash.com/iar-afB0QQw/1000x350)

Dotfiles
===

Hey 👋

This is where I push my dotfiles so that I have a backup. If you see something you link feel free to smash the star button. 

My config has been influenced by my experience using [dotmatrix](https://github.com/Hashrocket/dotmatrix). In this repo, you'll definitely see someplaces where I borrowed from that config.

Recently, I've migrated towards a NVIM focused setup. I used kickstart.nvim as a srping board and merged much of my existing config with some of the nice things there.

### Notable Packages

* **Shell:** [zsh](https://formulae.brew.sh/formula/zsh)
* **Shell Syntax Highlighting:** [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* **Prompt:** [starship](https://starship.rs)
* **Editor:** [neovim](https://github.com/neovim/neovim)
* **Vim-Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim)
* **iTerm Theme:**
  * [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme/blob/master/tokyo-night.itermcolors)

### Installation

You'll need to install the Homebrew depedencies listed in the [Brewfile](./Brewfile). At the very least, you will need `mise`, `zsh`, `starship`, `neovim`, and `fzf`

```shell
brew bundle
```

#### Set your shell to `zsh`

* Open `System Preferences` -> `Users & Groups`
* Rick click your user and click `Advanced Options` (You must unlock in the bottom left corner to make settings changes)
* Then, set you login shell to `/usr/local/bin/zsh`
* Restart your computer

#### Install the dotfiles

This will symlink the dotfiles in this repo to their correct location. Note that there's no nice-ities around this installation. If you want to hold onto your current config, I recommend renaming them or saving them to a temp dir before running this.

```shell
rake install
```

#### Mise Setup

In order to get the mise plugin working, you'll need to do some extra commands that I've yet to automate. These add support for the auto complete functions in zsh.

```
mise use -g usage
mkdir -p /opt/homebrew/share/zsh/site-functions
mise completion zsh  > /opt/homebrew/share/zsh/site-functions/_mise
```

#### Install NVIM Plugins

If it's your first time running NVIM with this config, lazy will automatically install all the plugins. However, you can install them yourself with the following

```
:LazyInstall
```

### Uninstall the dotfiles

This is will remove all symlinked dotfiles via `rm`

```
rake uninstall
```


##### Andrew Vogel

> Fear Is The Mind Killer
