require File.expand_path('./installer.rb')

task :install do
  Dotfiles.install!
end

task :uninstall do
  Dotfiles.uninstall!
end

task "install_nvim" do
  NvimConfigInstaller.new.install
end

task "alacritty_install" do
  AlacrittyConfigInstaller.new.install
end
