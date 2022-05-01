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

  def bg_black
    "\e[40m#{self}\e[0m"
  end

  def bg_red
    "\e[41m#{self}\e[0m"
  end

  def bg_green
    "\e[42m#{self}\e[0m"
  end

  def bg_brown
    "\e[43m#{self}\e[0m"
  end

  def bg_blue
    "\e[44m#{self}\e[0m"
  end

  def bg_magenta
    "\e[45m#{self}\e[0m"
  end

  def bg_cyan
    "\e[46m#{self}\e[0m"
  end

  def bg_gray
    "\e[47m#{self}\e[0m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  def italic
    "\e[3m#{self}\e[23m"
  end

  def underline
    "\e[4m#{self}\e[24m"
  end

  def blink
    "\e[5m#{self}\e[25m"
  end

  def reverse_color
    "\e[7m#{self}\e[27m"
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

    FileUtils.rm([abs_path(INIT_VIM_TARGET)])
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
    FileUtils.rm([abs_path('~/.zshrc'), abs_path('~/.zshrc.local')])
  end
end
