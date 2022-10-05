if status is-interactive
    if type -q nitch
        nitch
    end

    set -x EDITOR nvim
    set -x VISUAL nvim
    set fish_greeting

    # Commands to run in interactive sessions can go here

    set --universal hydro_color_pwd green
    set --universal hydro_color_git red

    source ~/code/dotfiles/shell_aliases
    source ~/code/dotfiles/shell_funcs.fish
end
