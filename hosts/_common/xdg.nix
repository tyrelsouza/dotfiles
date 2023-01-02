{ pkgs, ... }:
{
    xdg.configFile = {
      "nvim" = {
        source = ../../home/config/nvim;
        recursive = true;
      };
      "fish" = {
        source = ../../home/config/fish;
        recursive = true;
      };
    };

}
