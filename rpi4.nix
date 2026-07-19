{ ... }:

{
  imports = [ ./configuration.nix ]; 

  networking.hostName = "radio";     

  nixpkgs.hostPlatform = "aarch64-linux";   

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;  

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };
}
