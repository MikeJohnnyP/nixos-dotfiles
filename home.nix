{ config, pkgs, ... }:

{
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
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos, btw";
		};
	};
	home.file.".config/qtile".source = ./config/qtile;
	home.file.".config/nvim".source = ./config/nvim;
	
	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
	];
}
