{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  import = [
    inputs.home-manager.nixosModules.home-manager
  ];
}
