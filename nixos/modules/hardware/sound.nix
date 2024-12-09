{ pkgs, config, libs, ... }:

{
  ### Sound Settings ###
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    
    # media-session.enable = true;
    wireplumber.enable = true;
  };
}