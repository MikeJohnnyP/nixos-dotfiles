{ config, lib, pkgs, ... }:
let
  mod = "Mod4";
in 
{
    xsession.windowManager.i3 = {
        enable = true;
        config = {
            modifier = mod;
            bars = [ ];
            gaps = {
                inner = 2;
                outer = 1;
            };
            terminal = "ghostty";
        };
        extraConfig = ''
                default_border pixel 1
                for_window [class="ghostty, firefox, alacritty"] border none
                for_window [class="firefox"] move to workspace b
                font pango:JetBrainsMono Nerd Font 16
                exec --no-startup-id ghostty
                exec --no-startup-id ${pkgs.open-vm-tools}/bin/vmware-user
                exec i3-msg workspace 1
        '';
    };
}
