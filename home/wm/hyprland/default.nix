{ pkgs, lib, config, inputs, userSettings, ... }:

let thunar_pkg = with pkgs.xfce; 
  thunar.override {
    thunarPlugins = [ thunar-archive-plugin thunar-media-tags-plugin ];
  };
in {
  imports =  [
    inputs.hyprland.homeManagerModules.default

    ./avizo.nix
    ./gtk-theme.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./rofi
    ./swayimg.nix
    ./swaync
    ./waybar
  ];

  home.packages = [
    thunar_pkg
    (import ./scripts/xdg-terminal-exec.nix { inherit pkgs config; })    
  ] ++ (with pkgs; [  
    evince
    hyprpicker
    networkmanagerapplet
    nwg-displays
    pavucontrol
    wlr-randr
    xdg-utils
    file-roller
  ]);
  
  services.gnome-keyring.enable = true;
  services.blueman-applet.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    xwayland.enable = true;
    systemd.enable = true;

    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = import ./hypr-settings.nix { inherit pkgs lib config inputs userSettings thunar_pkg; };
  };

  home.activation.hyprlandActivation = ''
    run ${import ./scripts/hyreload.nix { inherit pkgs config userSettings; } }
  '';

  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=${config.home.homeDirectory}/Pictures/Screenshots
    save_filename_format=screen-%Y%m%d-%H%M%S.png
  '';

  nix.settings = {
    extra-trusted-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
