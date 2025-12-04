{ config, pkgs, lib, ... }:

let
  picomConfFile = ./../../config/picom/picom.conf;

in
{
  xdg.configFile."picom/picom.conf".source = picomConfFile;

  services.picom = {
    enable = true;
    settings = lib.mkForce {};

    extraArgs = [ "--config" "${config.xdg.configHome}/picom/picom.conf" ];
  };
}
