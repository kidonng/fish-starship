if ! command -sq starship
    source $__fish_data_dir/functions/fish_prompt.fish
    exit
end

function fish_prompt -d "Starship prompt"
    switch "$fish_key_bindings"
        case fish_{hybrid,vi}_key_bindings
            set STARSHIP_KEYMAP $fish_bind_mode
        case \*
            set STARSHIP_KEYMAP insert
    end

    starship prompt -d $CMD_DURATION -k $STARSHIP_KEYMAP -s $status -j (count (jobs -p))
end
