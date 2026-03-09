if status is-interactive

    # ── Hydro prompt ─────────────────────────────────────────
    set -g hydro_fetch true

    # ── PATH ─────────────────────────────────────────────────
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.opencode/bin
    fish_add_path (go env GOPATH)/bin

    # ── Environment variables ────────────────────────────────
    set -gx BAT_THEME "gruvbox-light"
    set -gx LUMINOVO_NUM_CPUS 12
    set -gx LUMINOVO_RUST_TOOLCHAIN nightly

    # ── Git abbreviations ────────────────────────────────────
    abbr -a g git
    abbr -a ga "git add"
    abbr -a gaa "git add --all"
    abbr -a gc "git commit"
    abbr -a gcm "git commit -m"
    abbr -a gco "git checkout"
    abbr -a gcb "git checkout -b"
    abbr -a gd "git diff"
    abbr -a gds "git diff --staged"
    abbr -a gf "git fetch"
    abbr -a gl "git log --oneline"
    abbr -a gp "git push"
    abbr -a gpf "git push --force-with-lease"
    abbr -a gpl "git pull"
    abbr -a gst "git status"
    abbr -a gsw "git switch"
    abbr -a gr "git rebase"
    abbr -a grs "git restore"

    # ── Aliases ──────────────────────────────────────────────
    alias v "nvim"

    # TMUX
    abbr -a t "tmux attach -t"
    abbr -a tnew "tmux new -s"
    abbr -a tk "tmux detach"
    abbr -a tds "tmux detach -s"
    abbr -a tks "tmux kill-session -t"
    abbr -a tls "tmux ls"
    abbr -a treorder "tmux movew -r"

    # General
    alias cat "bat --paging=never"
    alias ani "ani-cli"
    alias copy "xclip -selection c"
    alias j "z"
    alias notes "v ~/orgfiles/"
    alias zj "zellij --layout battlestation"

    # ── Tool integrations ────────────────────────────────────
    # fzf.fish plugin handles fzf bindings automatically

    # zoxide (replaces cd / z)
    if type -q zoxide
        zoxide init fish | source
    end

end
