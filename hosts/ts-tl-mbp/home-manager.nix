{ pkgs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    programs.home-manager.enable = true;
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
      ripgrep
      wget
    ];

    programs.tmux = {
      enable = true;
    };
    home.file = {
      ".tmux.conf" = {
        source = ../../home/tmux.conf;
        recursive = true;
      };
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
    #xdg.configFile = {
    #  "htop" = {
    #    source = ../../home/config/htop;
    #    recursive = true;
    #  };
    #};



    # XDG CONFIGS
    xdg.configFile = {
      "nvim" = {
        source = ../../home/config/nvim;
        recursive = true;
      };
      "fish" = {
        source = ../../home/config/fish;
        recursive = true;
      };
      "karabiner" = {
        source = ../../home/config/karabiner;
        recursive = true;
      };
    };

  }; # -- HomeManager
 
}
