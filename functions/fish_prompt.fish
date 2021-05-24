if ! command -sq starship
    source $__fish_data_dir/functions/fish_prompt.fish
    exit
end

function fish_prompt -d "Starship prompt"
    set -l keymap

    switch $fish_key_bindings
        case fish_{hybrid,vi}_key_bindings
            set keymap $fish_bind_mode
        case "*"
            set keymap insert
    end

    starship prompt -d $CMD_DURATION -k $keymap -s $status -j (count (jobs -p))
end
