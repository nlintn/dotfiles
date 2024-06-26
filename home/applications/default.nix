{ pkgs, inputs, ... }:

{
  imports = [ 
    # ./alacritty
    ./firefox.nix
    ./fzf.nix
    ./git.nix
    ./gpg.nix
    ./kitty
    ./neovim
    ./obs-studio.nix
    ./shell
    ./ssh.nix
    ./thunderbird.nix
    ./vim.nix
    ./vscode.nix
    ./yazi.nix
    ./zellij.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Coding stuff
    bear
    gdb
    github-desktop
    gitkraken
    (isabelle2024-rc1-vsce.overrideAttrs { applyNvimLspPatch = true; })
    jetbrains.idea-ultimate
    ocamlPackages.utop
    pwndbg
    (python3.withPackages ( python-pkgs: [
      python311Packages.pwntools
    ]))
    texlive.combined.scheme-full

    # Misc
    anki
    btop
    copyq
    desmume
    element-desktop
    fastfetch
    inkscape
    gimp
    libqalculate
    libreoffice-fresh
    lolcat
    nixln-edit
    obsidian
    speedread
    spotify
    spotify-tray
    telegram-desktop
    tree
    unzip
    vesktop
    wl-clipboard
    xournalpp
    zoom-us
  ];

  programs.zathura.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  services.kdeconnect.enable = true;
  services.kdeconnect.indicator = true;

  services.playerctld.enable = true;

  home.file.".gdbinit".text = ''
    source ${inputs.gdb-ptrfind}/ptrfind.py
  '';
}
