{ pkgs, ... }:
{
    home.stateVersion = "22.05";
    home.sessionVariables = {
      PAGER = "less -R";
      EDITOR = "nvim";
    };
    home.packages = with pkgs; [
      bat
      ctags
      exa
      fzf
      fd
      ripgrep
      tree-sitter
      silver-searcher
      wget
    ];

    home.file = {
      ".tmux.conf" = {
        source = ../../home/tmux.conf;
        recursive = true;
      };
      "bin" = {
        source = ../../home/bin;
        recursive = true;

      };
    };

}
