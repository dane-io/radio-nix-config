{ pkgs, ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  programs.nm-applet.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  users.users.dane = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    xfce4.xfce-whiskermenu-plugin
    firefox-esr
    flrig
    wsjtx
    js8call
    qsstv
    gridtracker2
    pavucontrol
  ];

  hardware.enableRedistributableFirmware = true;

  services.openssh.enable = false;

  system.stateVersion = "26.05";
}
