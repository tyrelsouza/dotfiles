{ pkgs, ... }:
{
    home.stateVersion = "22.05";
    home.sessionVariables = {
      PAGER = "less -R";
      EDITOR = "nvim";
    };
    home.packages = with pkgs; [
      # Terminals
      bat
      ctags
      exa
      fzf
      fd
      ncdu
      nodejs
      p7zip
      ripgrep
      tree-sitter
      silver-searcher
      wget
      maestral
      maestral-gui
    ];

    home.file = {
      ".tmux.conf" = {
        source = ../../home/tmux.conf;
      };
      ".gitconfig" = {
        source = ../../home/gitconfig;
      };
      ".gitignore" = {
        source = ../../home/gitignore;
      };
      "bin" = {
        source = ../../home/bin;
        recursive = true;

      };
    };

}
