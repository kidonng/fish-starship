if ! command -sq starship
    source $__fish_data_dir/functions/fish_mode_prompt.fish
    exit
end

function fish_mode_prompt -d "Mode prompt disabled by Starship prompt"
end
