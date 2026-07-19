{ ... }:

{
  imports = [ 
    ./configuration.nix
    /etc/nixos/hardware-configuration.nix
  ];
  networking.hostName = "radio-vm";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
}
