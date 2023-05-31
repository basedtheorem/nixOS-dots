{
  services.picom = {
    enable = false;

  };

  xdg.configFile."picom/picom.conf".source = ../configsource/picom.conf;
}
