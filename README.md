# NixOS notes/instructions
## Install on Raspberry Pi 4
1. Download the SD image from [https://hydra.nixos.org/job/nixos/release-26.05/nixos.sd_image.aarch64-linux](https://hydra.nixos.org/job/nixos/release-26.05/nixos.sd_image.aarch64-linux)
2. Install using Raspberry Pi Imager. (Don't change settings)
3. On the RPi, generate default config with `nixos-generate-config`
4. On the RPi, connect to WiFi with `nmtui`
5. Clone this repo on the RPi and follow [Rebuild config](#rebuild-config)

## Rebuild config
From this repository, do the following (choose relevant platform):
```bash
sudo nixos-rebuild switch -I nixos-config=./<PLATFORM>.nix
```