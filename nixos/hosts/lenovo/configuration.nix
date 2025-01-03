# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ ## Include the results of the hardware scan ##
      ./hardware-configuration.nix

      ## Bootloader settings ##
      ../../modules/bootloader/grub.nix

      ## NixOS general settings ##
      ../../modules/nix/settings.nix

      ## Linux Kernel settings ##
      #../../modules/hardware/kernel.nix


      ## Hardware ##
        # Nvidia 
      #../../modules/hardware/nvidia.nix

        # Logitech
      #../../modules/hardware/logitech.nix

        # Zram 
      #../../modules/hardware/zram.nix

        # Ntfs support 
      #../../modules/hardware/ntfs.nix

        # Bluetooth 
      #../../modules/hardware/bluetooth.nix

        # Sound settings 
      #../../modules/hardware/sound.nix


      ## User settings ##
      #../../modules/users/main.nix


      ## Network settings ##
      #../../modules/network/firewall.nix
      #../../modules/network/wireless.nix
      #../../modules/network/dns.nix
      #../../modules/network/proxy.nix


      ## Desktop Settings ##
        # Plasma Desktop 
      #../../modules/desktop/plasma.nix
      #../../modules/desktop/sddm.nix

        # Gnome Desktop 
      #../../modules/desktop/gnome.nix
      #../../modules/desktop/gdm.nix


      ## Shell settings ##
      ../../modules/shell/zsh.nix
      #../../modules/shell/kmscon.nix
      #../../modules/shell/shellAliases.nix

      ## Fonts ##
      ../../modules/fonts/settings.nix

      ## Locales ##
      #../../modules/locales/en-us.nix
      ../../modules/locales/ru-ru.nix
      #../../modules/locales/us-keymap.nix
      ../../modules/locales/ru-keymap.nix
      ../../modules/locales/baku-timeZone.nix


      ## Programs ##
      #../../modules/programs/common.nix


      ## Steam and games settings ##
      #../../modules/games/common.nix


      ## Virtualization ##
      #../../modules/virtualization/virtualbox.nix
      #../../modules/virtualization/qemu.nix
      #../../modules/virtualization/docker.nix


      ## Services ##
        # Btrfs auto scrub #
      #../../modules/services/btrfs-auto-scrub.nix

        # Mount service #
      #../../modules/services/mount-disk.nix

        # Tlp service #
      #../../modules/services/tlp.nix

        # Alsamixer settings #
      #../../modules/services/alsamixer-settings.nix

        # Wakeup Fix for GPD #
      #../../modules/services/wakeup-service.nix
    ];

  ## Overrides ##
  programs.nh = {
    enable = lib.mkForce true;
    flake = lib.mkForce "/home/ilham/nixos-configuration/nixos";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "lenovo"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Baku";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ru";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ilham = {
    isNormalUser = true;
    description = "ilham";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    neovim
    git
    xclip
    wl-clipboard
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
