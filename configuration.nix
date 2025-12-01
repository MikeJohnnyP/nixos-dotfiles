{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];

  virtualisation.vmware.guest.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos-btw"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Asia/Ho_Chi_Minh";


  services.xserver = {
  	enable = true;
	autoRepeatDelay = 200;
	autoRepeatInterval = 35;
	windowManager.qtile.enable = true;
  };
  services.displayManager.ly.enable = true;

  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.mikejohnp = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   git
   alacritty
 ];
 fonts.fontDir.enable = true;

 fonts.packages = with pkgs; [
 	nerd-fonts.jetbrains-mono
 ];
 
 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 system.stateVersion = "25.05";

}

