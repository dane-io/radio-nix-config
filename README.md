# NixOS notes/instructions
## Install on Raspberry Pi 4
1. Download the SD image from [https://hydra.nixos.org/job/nixos/release-26.05/nixos.sd_image.aarch64-linux](https://hydra.nixos.org/job/nixos/release-26.05/nixos.sd_image.aarch64-linux)
1. Unzip image with `unzstd` and install using Raspberry Pi Imager. (Don't change settings)
1. I noticed a misbehaving USB device enumerating over and over. Suppress these messages temporarily with `sudo dmesg -D`
1. On the RPi, connect to WiFi with `nmtui`
1. On the RPi, open a root shell with `sudo -i`
1. On the RPi, generate default config with `nixos-generate-config`
1. Add `git` to the packages in the default configuration and run `nixos-rebuild switch`
   - When doing this, leave the root shell open so you don't lose sudo privileges after regenerating the config
1. Clone this repo on the RPi under `/etc/nixos/`. Should result in a folder at `/etc/nixos/radio-nix-config/`
1. Edit `/etc/nixos/configuration.nix` to be the following and run `nixos-rebuild switch` again:
    ```nix
    { ... }:

    {
    imports = [
        ./radio-nix-config/rpi4.nix
    ];
    }
    ```
1. Add password to user with `passwd dane` **before rebooting**
1. Reboot and login normally
1. Once satisfied that the system is working, delete the old system generations to remove easy root access, etc: `sudo nix-collect-garbage -d`

## Update config
Pull changes from upstream in `/etc/nixos/radio-nix-config/` and then rebuild. Note, git may need to be ran as sudo here:
```bash
cd /etc/nixos/radio-nix-config
git pull
sudo nixos-rebuild switch
```

# Radio software instructions

## FLRig setup
- Setup -> Transceiver:
   - Rig: `Xiegu-G90`
   - Choose serial device
   - Baud: `115200`

## WSJT-X setup
### Radio tab
- Radio: `FLRig`
- CAT server: `127.0.0.1:12345`
- PTT method: `CAT`

### Audio tab
- Input: `alsa_input`
- Output: `alsa_output`

## JS8Call setup
### General tab
- Enter callsign and grid

### Radio tab
- Radio: `FLRig`
- CAT server: `127.0.0.1:12345`
- PTT method: `CAT` (had to restart JS8Call to get this to work)

### Audio tab
- Input: `USB Audio Device Mono`
- Output: `USB Audio Device Analog Stereo`
- Notification Soundcard: `Built-in Audio Stereo`

