{ config, lib, pkgs, ... }:

with lib;
let cfg = config.modules.core;
in {
  options.modules.core = {
    enable = mkEnableOption "Enable core configuration";
    
    packages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "List of core packages to install";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Các công cụ cơ bản 

    ] ++ cfg.packages;
  };
}