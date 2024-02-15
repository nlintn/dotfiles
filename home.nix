{ pkgs, inputs, ... }:

{
  imports = [ 
    ./home/applications/zsh/zsh.nix
    ./home/applications/alacritty.nix
    ./home/applications/tmux.nix
    ./home/applications/fzf.nix

    ./home/applications/vim.nix
    ./home/applications/vscode.nix

    ./home/applications/git.nix
    ./home/applications/ssh.nix
    ./home/applications/opam.nix
    ./home/applications/feh.nix
    # ./home/wm/hyprland.nix
  ];

  home.username = "nico";
  home.homeDirectory = "/home/nico";
  
  home.sessionVariables = {
    DOT_DIR = "$HOME/dotfiles";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Coding stuff
    clang_17 clang-tools_17
    cmake
    gdb pwndbg
    doctest
    cargo
    (python3.withPackages ( python-pkgs: [
      python311Packages.pwntools
    ]))
    jetbrains.idea-ultimate
    gitkraken # github-desktop
    nil

    # Misc
    htop
    firefox-wayland
    discord
    thunderbird
    spotify-tui
    gimp
    libqalculate
    tree
    wl-clipboard

    # Meme stuff
    neofetch
    # uwufetch curr not working :(( 
    lolcat
  ];

  services.kdeconnect.enable = true;
  services.kdeconnect.indicator = true;

  services.spotifyd = {
    enable = true;
    settings = {
      device_name = "meoww";
    };
  };  

  home.file.".gdbinit".text = ''
    source ${inputs.gdb-ptrfind + "/ptrfind.py"}
  '';

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
