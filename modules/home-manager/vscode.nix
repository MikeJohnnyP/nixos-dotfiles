{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
    };
    xdg.configFile = {
        "Code/User/settings.json".source   = ../../config/vscode/settings.json;
        "Code/User/keybindings.json".source = ../../config/vscode/keybindings.json;
    };
}
