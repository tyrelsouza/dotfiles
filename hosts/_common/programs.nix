{ pkgs, ... }:
{
    programs.home-manager.enable = true;
    programs.tmux = {
      enable = true;
    };
    programs.zsh.prezto = {
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
      plugins = with pkgs.vimPlugins; [
        # Inject tree-sitters, since they're annoying to maintain with sideloading
        (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      ];
    };

    programs.fish = {
      enable = true;
    };


    programs.htop = {
      enable = true;
    };
}
