{ pkgs, config, ... }:
{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  system.defaults.dock.autohide = true;

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
      fish
      ctags
      htop
      ripgrep
      wget
    ];

    programs.tmux = {
      enable = true;
    };
    home.file.".tmux".source = "../../tmux";
    home.file.".tmux.conf".source = "../../tmux.conf";

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

      #home.file."bin".source = "../../bin";
      #home.file.".gitconfig".source = "gitconfig";
      #home.file.".gitignore".source = "../../gitignore";
      #home.file.".hushlogin".source = "../../hushlogin";
      #home.file.".pythonstartup.py".source = "../../pythonstartup.py";
      #home.file.".shell_aliases".source = "../../shell_aliases";
      #home.file.".shell_funcs".source = "../../shell_funcs";
      #home.file.".shell_funcs.fish".source = "../../shell_funcs.fish";

  }; # -- HomeManager
 
  homebrew = {
    enable = true;
    casks = [
    "alfred"
    "discord"
    "slack"
    "karabiner-elements"
    ];
  };

 fonts.fonts = with pkgs; [
   noto-fonts
   dejavu_fonts
   nerdfonts # Includes font-awesome, material-icons, powerline-fonts
   iosevka
 ];

}
