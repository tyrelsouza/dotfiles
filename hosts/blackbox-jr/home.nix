{ pkgs, ... }:
{
    home.stateVersion = "22.05";
    home.sessionVariables = {
    };
    home.packages = with pkgs; [
      maestral
      maestral-gui
    ];

    home.file = {
    };

}
