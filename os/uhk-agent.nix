# https://github.com/garbas/dotfiles/blob/76f9da7c5d84b1595e8b9af31505bb13968ba7a4/nixos/grayworm.nix#L63
# https://www.reddit.com/r/NixOS/comments/f98mou/buildfhsuserenvappimage_recipe_for_gtk_programs/

{ config, lib, pkgs, ... }:

let
  custom_pkgs = self: super: {

    uhk-agent =
      let
        name = "uhk-agent-${version}";
        version = "1.3.0"; # version >1.3.0 causes it to hang on launch ("Loading configuration. Hang on")
        src = builtins.fetchurl {
          url = "https://github.com/UltimateHackingKeyboard/agent/releases/download/v${version}/UHK.Agent-${version}-linux-x86_64.AppImage";
          sha256 = {
            "1.2.12" = "1gr3q37ldixcqbwpxchhldlfjf7wcygxvnv6ff9nl7l8gxm732l6";
            "1.3.0" =  "09k09yn0iyivc9hf283cxrcrcyswgg2jslc85k4dwvp1pc6bpp07";
          }."${version}";
        };

        xdg_dirs = builtins.concatStringsSep ":" [
          "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
        ];

      in pkgs.appimageTools.wrapType2 {
        inherit name src;

        extraPkgs = pkgs: with pkgs; [
          # put runtime dependencies if any here
        ];

        extraInstallCommands = ''
          ln -s "$out/bin/${name}" "$out/bin/uhk-agent";
          mkdir -p $out/etc/udev/rules.d
          cat > $out/etc/udev/rules.d/50-uhk60.rules <<EOF
          # Ultimate Hacking Keyboard rules
          # These are the udev rules for accessing the USB interfaces of the UHK as non-root users.
          # Copy this file to /etc/udev/rules.d and physically reconnect the UHK afterwards.
          SUBSYSTEM=="input", GROUP="input", MODE="0666"
          SUBSYSTEMS=="usb", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="612[0-7]", MODE:="0666", GROUP="plugdev"
          KERNEL=="hidraw*", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="612[0-7]", MODE="0666", GROUP="plugdev"
          EOF
        '';
        profile = ''
          export XDG_DATA_DIRS="${xdg_dirs}''${XDG_DATA_DIRS:+:}"
          export APPIMAGE=''${APPIMAGE-""} # Kill a seemingly useless error message
        '';
      };
  };
in
{
  nixpkgs.overlays = [
    custom_pkgs
  ];
  environment.systemPackages = with pkgs; [
    uhk-agent
  ];
  services.udev.packages = with pkgs; [ uhk-agent ];
}