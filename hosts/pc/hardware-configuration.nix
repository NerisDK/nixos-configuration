# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Masks permissions usage:
  #   0  1  2  3  4  5  6  7
  # r +  +  +  +  -  -  -  -
  # w +  +  -  -  +  +  -  -
  # x +  -  +  -  +  -  +  -


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1505e710-4424-4a42-9c5c-c86779179c0f";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F4A6-2F68";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/mnt/homedisk" =
    { device = "/dev/disk/by-uuid/530b3477-f32c-4b2d-88d0-870ee2655804";
      fsType = "btrfs";
      # options = [ "rw" "uid=1000" ]; # Enable read-write for this device.
      # options = [ 
      #   # "uid=ilham" 
      #   # "gid=users" 
      #   # "dmask=0007" 
      #   # "fmask=0117"
      #   # "nofail" 
      # ];
      # options = [ "allow_other" ]; # For non-root access
    };

  # Connect NTFS disk
  fileSystems."/mnt/windisk" =
    { device = "dev/disk/by-uuid/687445E47445B61A";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/fab27529-0474-48e0-b727-86a70c7a518f"; }
    ];
  

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f0u5.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
