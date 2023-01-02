{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  system.defaults.dock.autohide = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.tyrel = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.stateVersion = "22.05";

    home.packages = with pkgs; [
        (neovim.override {
              vimAlias = true;
        })
	fish
	htop
	ripgrep
	tmux
	wget
    ];

    #home.file.".config/".source = "../../config/";
    #home.file."bin".source = "../../bin";
    #home.file.".gitconfig".source = "gitconfig";
    #home.file.".gitignore".source = "../../gitignore";
    #home.file.".hushlogin".source = "../../hushlogin";
    #home.file.".pythonstartup.py".source = "../../pythonstartup.py";
    #home.file.".shell_aliases".source = "../../shell_aliases";
    #home.file.".shell_funcs".source = "../../shell_funcs";
    #home.file.".shell_funcs.fish".source = "../../shell_funcs.fish";
    #home.file.".tmux".source = "../../tmux";
    #home.file.".tmux.conf".source = "../../tmux.conf";


  };
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
