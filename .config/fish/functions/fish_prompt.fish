function fish_prompt
    set -l c_user (set_color -o white)
    set -l c_path (set_color cyan)
    set -l c_branch (set_color yellow)
    set -l c_prompt (set_color red)
    set -l c_reset (set_color normal)

    set -l git_info ""
    set -l branch (command git branch --show-current 2>/dev/null)
    if test -n "$branch"
        set -l gs (command git status --porcelain 2>/dev/null)
        set -l flag ""
        if test -n "$gs"
            set flag " [+]"
            set -l all_untracked 1
            for line in $gs
                if not string match -q '??*' -- $line
                    set all_untracked 0
                    break
                end
            end
            test $all_untracked -eq 1; and set flag " [?]"
        end
        set git_info " on $c_branch$branch$c_reset$flag"
    end

    echo "$c_user$USER$c_reset at $c_user$hostname$c_reset in $c_path"(prompt_pwd)"$c_reset$git_info"
    echo -n "$c_prompt❱$c_reset "
end
