require 'fileutils'

class String
  def black
    "\e[30m#{self}\e[0m"
  end

  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def brown
    "\e[33m#{self}\e[0m"
  end

  def blue
    "\e[34m#{self}\e[0m"
  end

  def magenta
    "\e[35m#{self}\e[0m"
  end

  def cyan
    "\e[36m#{self}\e[0m"
  end

  def gray
    "\e[37m#{self}\e[0m"
  end
end

class Dotfile
  def install
    raise :not_implemented
  end

  def uninstall
    raise :not_implemented
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  protected

  def symlink(file, target_path)
    FileUtils.ln_sf(abs_path(file), abs_path(target_path))
  end

  def rm(files)
    FileUtils.rm(Array(files).map { |f| abs_path(f) })
  end

  def abs_path(rel_path)
    File.expand_path(rel_path, __dir__)
  end
end

module Dotfiles
  module_function

  def install!
    Dotfile.descendants.each { |i| i.new.install }
    puts 'Done'.green
  end

  def uninstall!
    Dotfile.descendants.each { |i| i.new.uninstall }
    puts 'Done'.green
  end
end

class NvimConfigInstaller < Dotfile
  INIT_VIM_TARGET = '~/.config/nvim/init.vim'.freeze

  def install
    puts 'Installing nvim config...'.cyan
    nvim_config_dir = abs_path('~/.config/nvim')
    FileUtils.mkdir_p(nvim_config_dir)

    symlink('./init.vim', INIT_VIM_TARGET)
  end

  def uninstall
    puts 'Uninstalling nvim config...'.brown
    return unless File.symlink?(abs_path(INIT_VIM_TARGET))

    rm(INIT_VIM_TARGET)
  end
end

class ZshRcInstaller < Dotfile
  def install
    puts 'Installing zsh config...'.cyan
    symlink('./.zshrc', '~/.zshrc')
    symlink('./.zshrc.local', '~/.zshrc.local')
  end

  def uninstall
    puts 'Uninstalling zsh config...'.brown
    rm(['~/.zshrc', '~/.zshrc.local'])
  end
end

class AckRcInstaller < Dotfile
  def install
    puts 'Installing ack config...'.cyan
    symlink('./.ackrc', '~/.ackrc')
  end

  def uninstall
    puts 'Uninstalling ack config...'.brown
    rm(['~/.ackrc'])
  end
end

class GitConfigInstaller < Dotfile
  def install
    puts 'Installing git config...'.cyan
    symlink('./.gitconfig', '~/.gitconfig')
    symlink('./.gitconfig.local', '~/.gitconfig.local')
    symlink('./.gitignore', '~/.gitignore')
  end

  def uninstall
    puts 'Uninstalling git config...'.brown
    rm(['~/.gitconfig', '~/.gitconfig.local', '~/.gitignore'])
  end
end
