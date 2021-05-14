if ! command -sq starship
    builtin source $__fish_data_dir/functions/fish_mode_prompt.fish
    exit
end

function fish_mode_prompt
end
