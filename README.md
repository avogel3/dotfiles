![](https://source.unsplash.com/iar-afB0QQw/1000x350)

Dotfiles
===

Hey 👋

This is where I push my dotfiles so that I have a backup. If you see something you link feel free to "smash that star button". 

My config is largely influenced from my experience using the [dotmatrix](https://github.com/Hashrocket/dotmatrix) project by [Hashrocket](https://github.com/Hashrocket). In this repo, you'll definitely see someplaces where I borrowed from their config.

Anyways, thanks for stopping by. 

### Notable Packages

* **Shell:** [zsh](https://formulae.brew.sh/formula/zsh)
* **Shell Syntax Highlighting:** [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* **Prompt:** [starship](https://starship.rs)
* **Editor:** [neovim](https://github.com/neovim/neovim)
* **Vim-Plugins:** [vim-plug](https://github.com/junegunn/vim-plug)
* **iTerm Theme:** [iterm2-snazzy](https://github.com/sindresorhus/iterm2-snazzy)

### Installation

You'll need to install the Homebrew depedencies listed in the [Brewfile](./Brewfile). At the very least, you will need `asdf`, `zsh`, `starship`, `neovim`, and `fzf`

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

#### Install Vim Plugins

From within NVIM run the vim-plug installation command: 

```
:PlugInstall
```

### Uninstall the dotfiles

This is will remove all symlinked dotfiles via `rm`

```
rake uninstall
```


##### Andrew Vogel

> Fear is the mind killer
