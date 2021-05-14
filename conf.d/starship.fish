function _starship_install -e starship_install
    set -Ux STARSHIP_SHELL fish
    set -U VIRTUAL_ENV_DISABLE_PROMPT 1
end

function _starship_uninstall -e starship_uninstall
    for prompt in fish_{,mode_}prompt
        builtin source $__fish_data_dir/functions/$prompt.fish
    end

    set -e STARSHIP_SESSION_KEY STARSHIP_SHELL VIRTUAL_ENV_DISABLE_PROMPT
    builtin functions -e _starship_{,un}install
end

if ! status -i || ! command -sq starship
    exit
end

set -x STARSHIP_SESSION_KEY (random 10000000000000 9999999999999999)
