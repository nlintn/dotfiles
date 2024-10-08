{ pkgs, config, ... }:

let  
  shellAliases = {
    c = "clear";
    confdir = "builtin cd $NIX_CONFIG_DIR";
    hms = "home-manager switch --flake $NIX_CONFIG_DIR";
    nrs = "nixos-rebuild switch --flake $NIX_CONFIG_DIR --use-remote-sudo";
    nrb = "nixos-rebuild boot --flake $NIX_CONFIG_DIR --use-remote-sudo";
    nv = builtins.toString (pkgs.writeShellScript "nv" /* bash */ ''
      if [[ $# -gt 0 ]] then
        ${config.programs.neovim.finalPackage}/bin/nvim $@
      else
        ${config.programs.neovim.finalPackage}/bin/nvim .
      fi
    '');
    open = builtins.toString (pkgs.writeShellScript "open" /* bash */ ''
      xdg-open "$*" > /dev/null 2>&1 & disown
    '');
  };
in {
  programs.zsh = {
    enable = true;
    initExtra = (import ./zsh-syntax-highlighting-base16.nix { inherit pkgs config; }) + /* bash */ ''
      bindkey -v
      bindkey -M vicmd 'V' edit-command-line
      VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
      VI_MODE_SET_CURSOR=true
      KEYTIMEOUT=1
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      custom = builtins.path { name = "oh-my-zsh-custom"; path = ./oh-my-zsh-custom; recursive = true; };
      plugins = [ "colored-man-pages" "git" "themes" "vi-mode" ];
      theme = "meoww_lambda";
    };
    inherit shellAliases;
  };

  programs.bash = {
    enable = true;
    inherit shellAliases;
  };
}

