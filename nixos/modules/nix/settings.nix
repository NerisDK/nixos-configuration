{ pkgs, config, libs, ... }:

{
  ### Allow unfree packages ###
  nixpkgs.config.allowUnfree = true;


  ### Experimental features ###
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  ### Automatic Nix Garbage Collector ### Disabled due to Nix Helper
  nix.gc = {
    automatic = false;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  
  ### Nix Helper ###
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";

    clean = 
    { # Garbage Collector
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d";
    };    
  };
}