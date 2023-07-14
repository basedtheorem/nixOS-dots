{ config, lib, pkgs, ... }:

let cfg = config.gnome;

in {
  options.gnome = {
    enable = lib.mkEnableOption "Gnome";

    minimal = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to remove most of the pre-installed applications
        that come with the Gnome Desktop Environment.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = lib.mkIf cfg.minimal
      (with pkgs; [
        gnome-photos
        gnome-tour
      ])
      ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        gnome-terminal
        simple-scan
        eog # image viewer
        gedit # text editor
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
      ]);
  };
}