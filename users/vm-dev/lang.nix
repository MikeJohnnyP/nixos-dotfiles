{ pkgs, lib, ... }:

let
  python_version = pkgs.python3_13;
in
{
  home.packages = with pkgs; [
    # Python
    python3
    # Node.js
    nodejs_latest
    #jdk21
    jdk21_headless
  ];

  home.sessionVariables = {
    # Python
    PYTHONSTARTUP = "${pkgs.python3}/lib/python3.13/site-packages";

    # Node.js
    NODE_PATH = "~/.npm-global/lib/node_modules";

    # Java 21
    JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";

  };
}
