if status is-interactive
    set -gx PATH /Users/tyrel/bin $PATH

    set -x XDG_DATA_HOME "$HOME/.local/share"
    set -x XDG_CONFIG_HOME "$HOME/.config"
    set -x XDG_STATE_HOME "$HOME/.local/state"

    set --universal hydro_color_pwd green
    set --universal hydro_color_git red

    source ~/.config/fish/shell_funcs.fish
    source ~/.config/fish/shell_aliases.fish


    set PATH $PATH ~/.cargo/bin
end
