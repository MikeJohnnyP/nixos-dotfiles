{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.mikejohnp.packages = lib.mkDefault [
    pkgs.vim
    pkgs.home-manager
  ];

  environment.systemPackages = [
    pkgs.docker-compose
    pkgs.lazydocker
    pkgs.tlrc  
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo I use nixos, btw";
    };
  };

  users.defaultUserShell = pkgs.zsh;
  
  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };

  # Garbage Collector Setting
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 7d";
}
