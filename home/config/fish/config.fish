if status is-interactive
    set -x EDITOR nvim
    set -x VISUAL nvim
    set fish_greeting

    # Commands to run in interactive sessions can go here

    set --universal hydro_color_pwd green
    set --universal hydro_color_git red

    # source ~/code/dotfiles/shell_aliases
    # source ~/code/dotfiles/shell_funcs.fish
    source ~/.config/fish/shell_funcs.fish
    source ~/.config/fish/shell_aliases.fish
    source ~/.config/fish/everquote.fish
end
