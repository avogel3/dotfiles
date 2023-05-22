require 'fileutils'
require 'pathname'

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
  NVIM_CONFIG_DIR = '~/.config/nvim'.freeze

  def config_files
    [
      "init.lua",
      "lua"
    ]
  end

  def install
    puts 'Installing nvim config...'.cyan
    FileUtils.mkdir_p(abs_path(NVIM_CONFIG_DIR))

    config_files.each do |fd|
      symlink(abs_path("./config/nvim/#{fd}"), abs_path(Pathname.new(NVIM_CONFIG_DIR).join(fd)))
    end
  end

  def uninstall
    puts 'Uninstalling nvim config...'.brown

    rm(config_files.map do |fd|
      abs_path(Pathname.new(NVIM_CONFIG_DIR).join(fd))
    end)
  end
end


class AlacrittyConfigInstaller < Dotfile
  AC_CONFIG_DIR = '~/.config/alacritty'.freeze

  def config_files
    Dir["./config/alacritty/*.yml"].map { |filepath| File.basename(filepath) }
  end

  def install
    puts 'Installing alacritty config...'.cyan
    FileUtils.mkdir_p(abs_path(AC_CONFIG_DIR))

    config_files.each do |fd|
      symlink(abs_path("./config/alacritty/#{fd}"), abs_path(Pathname.new(AC_CONFIG_DIR).join(fd)))
    end
  end

  def uninstall
    puts 'Uninstalling alacritty config...'.brown

    rm(config_files.map do |fd|
      abs_path(Pathname.new(AC_CONFIG_DIR).join(fd))
    end)
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

class TmuxConfigInstaller < Dotfile
  def install
    puts 'Installing tmux config...'.cyan
    symlink('./.tmux.conf', '~/.tmux.conf')
  end

  def uninstall
    puts 'Uninstalling git config...'.brown
    rm('~/.tmux.conf')
  end
end
