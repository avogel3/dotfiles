![](https://cnet1.cbsistatic.com/img/-r7adjMKEoTeUc3E54Bp6AOBxLk=/1600x900/2017/10/16/89b1c377-e514-4428-9221-c4493d07b509/matrix-code.jpg)

Dotfiles
===

### Notable Packages

* **Shell:** [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* **Tooling** [dotmatrix](https://github.com/hashrocket/dotmatrix)
* **Editor Theme:** `material-design.itermcolors` - Not sure where I got this
* **Prompt:** [pure](https://github.com/sindresorhus/pure)


### Installation

Install the above packages first, then symlink the dotfiles to the home directory.

```ruby
ln -sf .zshrc.local ~/.zshrc.local
ln -sf .vimc.local ~/.vimrc.local
ln -sf .tmux.conf.local ~/.tmux.conf.local
ln -sf .vimbundle.local ~/.vimbundle.local
```


##### Andrew Vogel
