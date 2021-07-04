function _starship_install -e starship_install
    set -Ux STARSHIP_SHELL fish
    set -U VIRTUAL_ENV_DISABLE_PROMPT 1
end

function _starship_uninstall -e starship_uninstall
    for prompt in fish_{,mode_}prompt
        source $__fish_data_dir/functions/$prompt.fish
    end

    set -e STARSHIP_{SESSION_KEY,SHELL} VIRTUAL_ENV_DISABLE_PROMPT
    functions -e _starship_{,un}install
end

if ! status -i || ! command -sq starship
    exit
end

set -gx STARSHIP_SESSION_KEY (random 10000000000000 9999999999999999)
