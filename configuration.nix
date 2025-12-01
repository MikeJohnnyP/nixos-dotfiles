{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
#      /home/mikejohnp/nixos-dotfiles/custom.nix
    ];

  # virtualisation.vmware.guest.enable = true;

  # fix ratio with vm
  services.vmwareGuest.enable = true;
  services.vmwareGuest.headless = false;
  services.xserver.videoDrivers = [ "vmware" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";


  services.xserver = {
  	enable = true;
    # autoRepeatDelay = 200;
    # autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
    xkb.layout = "us";
    xkb.variant = "";

    xkbOptions = "ctrl:nocaps";
  };
  services.displayManager.ly.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  users.users.mikejohnp = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   tree
   gh
   gcc
   home-manager
   open-vm-tools
   git
   alacritty
 ];
 fonts.fontDir.enable = true;

 fonts.packages = with pkgs; [
 	nerd-fonts.jetbrains-mono
 ];
 
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 services.openssh.enable = true;

 system.stateVersion = "25.05";

}

