if status is-interactive
    function __zellij_auto_tab_name --on-event fish_prompt
        if set -q ZELLIJ
            command zellij-auto-tab-name >/dev/null 2>&1 &
        end
    end
end
