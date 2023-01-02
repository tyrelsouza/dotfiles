{ pkgs, config, lib, ... }:
{
 fonts.fonts = with pkgs; [
   noto-fonts
   dejavu_fonts
   nerdfonts # Includes font-awesome, material-icons, powerline-fonts
   iosevka
 ];

}
