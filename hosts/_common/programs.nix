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
      #plugins = with pkgs.vimPlugins; [
      #  # Inject tree-sitters, since they're annoying to maintain with sideloading
      #  (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      #];
      plugins = [
         pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
      # We used to manage our own init.lua but now we want the home-manager
      # managed init.vim to load our init.lua which makes this a little dirty.
      extraConfig = ''
      lua << EOF
       ${builtins.readFile ../../home/config/nvim/init.lua}
      EOF
      '';
    };

    programs.htop = {
      enable = true;
    };
}
