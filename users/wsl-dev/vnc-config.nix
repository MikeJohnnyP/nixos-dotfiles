{ pkgs, lib, ... }:

let monitor = "1920x1080";
    depth = "24";
    sessionPath = "~/.Xsession";
    afPort = "12"; # Port 5912

in
{
	home.packages = with pkgs; [
		turbovnc
		(pkgs.writeShellScriptBin "vnc-start" ''
		      vncserver -depth ${depth} -fg -geometry ${monitor} -xstartup ${sessionPath} :${afPort}
		'')
	];

	 home.file.".Xsession" = {
	    force = true;
	    text = ''
		export DISPLAY=:${afPort}  # Use display number 12 (port 5912)
		export DONT_PROMPT_WSL_INSTALL=1

		# Fixes for: 1. spurious scroll lock events (affecting Emacs, etc.), 2. activating the tilde key.
		unset SESSION_MANAGER
		unset DBUS_SESSION_BUS_ADDRESS

		# Clean environment
		export XMODIFIERS=""
		export GTK_IM_MODULE=""
		export QT_IM_MODULE=""
		export INPUT_METHOD=""

		# Keyboard setup (adjust -layout se to your own layout)
		# setxkbmap -model pc105 -layout se -variant nodeadkeys
		# setxkbmap -model pc105 -layout us -variant intl
		setxkbmap -model pc105 -layout us
		xmodmap -e "keycode 78 = "  # Disable spurious scroll lock
		xmodmap -e "keycode 108 = ISO_Level3_Shift"  # Fix AltGr
		xmodmap -e "clear mod5"
		xmodmap -e "add mod5 = ISO_Level3_Shift"

		# Start window manager
		exec i3
	'';
	    executable = true;
	 };

}
