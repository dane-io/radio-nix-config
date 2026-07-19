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
    xfce.xfce4-whiskermenu-plugin
    flrig
    wsjtx
    js8call
    qsstv
    gridtracker2
    pavucontrol
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;
      DontCheckDefaultBrowser = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
        };
      };
    };
  };

  hardware.enableRedistributableFirmware = true;

  services.openssh.enable = false;

  system.stateVersion = "26.05";
}
