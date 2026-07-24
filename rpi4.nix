{ ... }:

{
  imports = [ 
    ./configuration.nix
    /etc/nixos/hardware-configuration.nix
    <nixos-hardware/raspberry-pi/4>
  ];

  hardware.raspberry-pi."4".fkms-3d.enable = true;

  networking.hostName = "radio";     

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;  
  boot.loader.generic-extlinux-compatible.configurationLimit = 10;
}
