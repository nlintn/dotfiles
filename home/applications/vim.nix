{ pkgs, userSettings, ... }:

{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      mouse = "a";
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
    };
    plugins = with pkgs.vimPlugins; [
      catppuccin-vim
    ];
    extraConfig = /* vim */ ''
      set ignorecase

      " Cursor Settings
      let &t_SI = "\e[5 q"
      let &t_EI = "\e[1 q"
      augroup myCmds
      au!
      autocmd VimEnter * silent !echo -ne "\e[2 q"
      augroup END
      " autocmd InsertEnter * set cursorline
      " autocmd InsertLeave * set nocursorline

      set clipboard=unnamedplus

      " Wraparound lines while navigating
      set whichwrap+=<,>,h,l,[,]

      " Visual Stuff
      set termguicolors
      colorscheme catppuccin_${userSettings.catppuccin-flavour}
      autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
      if $XTERM == 'xterm-256color'
        set ttymouse=sgr
      endif
    ''; 
  };
}

