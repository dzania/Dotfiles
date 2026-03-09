if status is-interactive
    # Escape in normal (default) mode → prepend sudo
    bind -M default escape 'fish_commandline_prepend sudo'

    # Ctrl+F → tmux-sessionizer
    bind -M insert \cf 'commandline -r "tmux-sessionizer"; commandline -f execute'
    bind -M default \cf 'commandline -r "tmux-sessionizer"; commandline -f execute'
end
