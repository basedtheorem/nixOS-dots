{ pkgs, ... }: {

  programs.rofi = {
    enable = true;

    plugins = [
    pkgs.rofi-calc
    pkgs.rofi-emoji
    ];
  };
  
  xdg.configFile."rofi".source = ../configsource/rofi;
  xdg.configFile."rofi".recursive = true;
}