{ ... }:

{
  imports = [ 
    ./configuration.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "radio";     

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;  
}
