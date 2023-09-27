{ pkgs, config, ... }:
{
    xdg.configFile = {
      "nvim" = {
        source = ../../home/config/nvim;
        recursive = true;
      };
      "nvim/lua" = {
          source = config.lib.file.mkOutOfStoreSymlink ../config/nvim/lua;
          recursive = true;
      };
      "nvim/legacy.vim".source = config.lib.file.mkOutOfStoreSymlink ../../home/config/nvim/legacy.vim;
      "htop" = {
        source = ../../home/config/htop;
        recursive = true;
      };
    };

}
