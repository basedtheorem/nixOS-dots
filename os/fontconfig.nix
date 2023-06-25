{ pkgs, config, ... }: {

  fonts = {
    fontDir.enable = true;
    
    fonts = with pkgs; [
      pkgs.corefonts
      google-fonts
      ankacoder
      material-design-icons
      roboto
      iosevka-comfy.comfy
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      twitter-color-emoji
      liberation_ttf
      (nerdfonts.override { fonts = [
        "FiraCode"  
        "DroidSansMono"
        "Gohu"
        "NerdFontsSymbolsOnly"
      ]; })
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb";
      hinting = {
        enable = true;
        autohint = true;
        style = "slight";
      };
      defaultFonts = {
        serif = [ "Roboto" "Symbols Nerd Font Mono" ];
        sansSerif = [ "Readex Pro" "Symbols Nerd Font Mono" ];
        monospace = [ "jetBrains Mono" "Symbols Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" "Symbols Nerd Font Mono" ];
      };
    };
  };
}
