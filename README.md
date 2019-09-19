![](https://cnet1.cbsistatic.com/img/-r7adjMKEoTeUc3E54Bp6AOBxLk=/1600x900/2017/10/16/89b1c377-e514-4428-9221-c4493d07b509/matrix-code.jpg)

Dotfiles
===

### Notable Packages

* **Shell:** [zsh](https://formulae.brew.sh/formula/zsh)
* **Shell Syntax Highlighting:** [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* **Prompt:** [starship](https://starship.rs)
* **Tooling:** [dotmatrix](https://github.com/hashrocket/dotmatrix)
* **iTerm Theme:** [iterm2-snazzy](https://github.com/sindresorhus/iterm2-snazzy)


### Installation

Install the latest version of ZSH from homebrew

```sh
brew install zsh
```

Set you shell. (This may not work on newer versions of OSX.)

```sh
chsh -s /bin/zsh
```

Next, follow install instructions for Starship.rs

Then Symlink your dotfiles

```sh
ln -sf .zshrc.local ~/.zshrc.local
ln -sf .vimc.local ~/.vimrc.local
ln -sf .tmux.conf.local ~/.tmux.conf.local
ln -sf .vimbundle.local ~/.vimbundle.local
```

Copy Starship config, relative symlinks don't work

```
ln -sf "$(pwd)/.starship.toml" "/Users/avogel/.config/starship.toml"
```



##### Andrew Vogel
