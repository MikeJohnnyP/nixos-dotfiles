{ config, pkgs, ... }:

{
	imports = [
    	../../modules/home-manager/default.nix
		../../modules/home-manager/i3-wm.nix
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

	within.zsh.enable = true;
	within.ghostty.enable = true;

	nixpkgs.config.allowUnfree = true;
	
  	programs.vscode.enable = true;
	home.file.".config/nvim".source = ../../config/nvim;

	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		alacritty
		ghostty
		fastfetch
		vscode
	];

	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
