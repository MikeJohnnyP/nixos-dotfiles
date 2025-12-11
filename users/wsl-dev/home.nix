{ config, pkgs, ... }:

{
  imports = [
    ./../../modules/home-manager/neovim.nix
    ./../../modules/home-manager/zsh.nix
    ./../../modules/home-manager/tmux.nix
    ./../../modules/home-manager/i3-wm.nix
    ./../../modules/home-manager/alacritty.nix
    ./vnc-config.nix
    ./lang.nix
  ];

  home.username = "mikejohnp";
  home.homeDirectory = "/home/mikejohnp";
  programs.git = {
    enable = true;
    userName = "MikeJohnP";
    userEmail = "tahoangphuc1901@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vi";
    };
  };
  home.stateVersion = "25.05";

  within.alacritty.enable = true;
  within.zsh.enable = true;
  within.neovim.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ripgrep
    nil
    fastfetch
    feh
    lazygit
    nerd-fonts.jetbrains-mono
    google-chrome
    unzip
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
