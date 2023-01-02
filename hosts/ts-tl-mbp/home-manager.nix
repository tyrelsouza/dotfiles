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
      ctags
      exa
      bat
      fzf
      ripgrep
      wget
    ];

    programs.tmux = {
      enable = true;
    };
    #home.file.".tmux".source = "../../tmux";
    #home.file.".tmux.conf".source = "../../tmux.conf";

    programs.git = {
      enable = true;
      includes = [
        { path = "~/code/tyrel.dev/dotfiles/gitconfig"; }
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
    xdg.configFile = {
      "nvim" = {
        source = ../../config/nvim;
        recursive = true;
      };
    };

    programs.fish = {
     enable = true;
    };
    xdg.configFile = {
      "fish" = {
        source = ../../config/fish;
        recursive = true;
      };
    };


    programs.htop = {
      enable = true;
    };
    #xdg.configFile = {
    #  "htop" = {
    #    source = ../../config/htop;
    #    recursive = true;
    #  };
    #};




    # Brew's XDG CONFIGS
    xdg.configFile = {
      "karabiner" = {
        source = ../../config/karabiner;
        recursive = true;
      };
    };

  }; # -- HomeManager
 
}
