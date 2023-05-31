{ config, pkgs, ... }:

{
  imports = [
    ./apps/helix.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/vivaldi.nix
    ./apps/rofi.nix
    
    ./services/picom.nix
  ];
  
  home.username = "l";
  home.homeDirectory = "/home/l";
  home.stateVersion = "22.11";

  home.packages = with pkgs; [
  # Utils
    htop
    brightnessctl
    ripgrep
    fzf
    file
    fd
    tldr
    bat
    pciutils
    jq
    wget
    neofetch
    kitty
    starship
    feh
    nil
    imwheel
    

  # Desktop
    qtile
    ranger
    xwallpaper
    xbanish
    xorg.xset
    dunst
    zathura
    fontpreview
    flameshot
    cloudflare-warp
     
  # Apps
    vivaldi-ffmpeg-codecs
    flatpak
    obsidian
    vscode-fhs
    armcord
    
  # Media
    mpv
    ffmpeg
    yt-dlp
    widevine-cdm
    alsa-utils
          
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".icons/default".source = "${pkgs.nordzy-cursor-theme}/share/icons/Nordzy-cursors";
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  home.sessionVariables = {
    EDITOR = "hx";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

 
  programs.home-manager.enable = true;
}
