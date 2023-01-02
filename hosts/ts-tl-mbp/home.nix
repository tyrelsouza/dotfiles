{ ... }: {
  programs.home-manager.enable = true;
  home.packages = [
  ];
  programs.git = {
    enable = true;
  };
  programs.nvim = {
    enable = true;
  };
}
