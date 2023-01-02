{ pkgs, ... }:
{
    programs.home-manager.enable = true;
    programs.tmux = {
      enable = true;
    };

    programs.git = {
      enable = true;
      includes = [
        { path = "~/code/tyrel.dev/dotfiles/home/gitconfig"; }
      ];
      aliases = {
        ap = "add -p";
      };
      extraConfig = {
        pull.ff = "only";
      };
    };

    programs.neovim = {
      enable = true;
    };
    programs.fish = {
     enable = true;
    };


    programs.htop = {
      enable = true;
    };
}
