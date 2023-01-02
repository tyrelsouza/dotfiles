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
      # We used to manage our own init.lua but now we want the home-manager
      # managed init.vim to load our init.lua which makes this a little dirty.
      # extraConfig = ''
      # lua << EOF
      #  ${builtins.readFile ../../home/config/nvim/init.lua}
      # EOF
      # '';
    };

    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
          {
            name = "fish-ssh-agent";
            src = pkgs.fetchFromGitHub {
              owner = "danhper";
              repo = "fish-ssh-agent";
	      rev = "fd70a2afdd03caf9bf609746bf6b993b9e83be57";
	      sha256 = "e94Sd1GSUAxwLVVo5yR6msq0jZLOn2m+JZJ6mvwQdLs=";
            };
          }

          {
            name = "nix-env.fish";
            src = pkgs.fetchFromGitHub {
              owner = "lilyball";
              repo = "nix-env.fish";
	      rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
	      sha256 = "RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
            };
          }
      ];
    };
    


    programs.htop = {
      enable = true;
    };
}
