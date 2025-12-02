{ config, pkgs, ... }:

{
	imports = [
    	../../modules/home-manager/default.nix
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
	
  	programs.vscode.enable = true;
	home.file.".config/qtile".source = ../../config/qtile;
	home.file.".config/nvim".source = ../../config/nvim;
	
	home.packages = with pkgs; [
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
	];

	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
