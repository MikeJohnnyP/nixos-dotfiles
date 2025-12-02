{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
      ./custom.nix
    ];

  # fix ratio with vm
  virtualisation.vmware.guest = {
    enable = true;
    headless = false;
  };
  # services.xserver.videoDrivers = [ "vmware" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  # networking.nameservers = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];

  # Hoặc nếu dùng NetworkManagerg
  networking.networkmanager.dns = "none";
  networking.resolvconf.enable = false;  # tắt resolvconf của NM

  time.timeZone = "Asia/Ho_Chi_Minh";

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };


  services.xserver = {
  	enable = true;
    # autoRepeatDelay = 200;
    # autoRepeatInterval = 35;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "ctrl:nocaps";
  };

  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+i3";

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
  nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
   vim
   wget
   tree
   gh
   gcc
   home-manager
   open-vm-tools
   git
 ];
 fonts.fontDir.enable = true;

 fonts.packages = with pkgs; [
 	nerd-fonts.jetbrains-mono
 ];
 
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 services.openssh.enable = true;

 system.stateVersion = "25.05";

}

