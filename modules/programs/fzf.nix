{...}: {
    flake.modules.homeManager.fzf = {
        programs.fzf = {
            enable = true;
            defaultOptions = [
                "--keep-right"
                "--smart-case"
                "--margin 2"
                "--info=right"
                "--scrollbar █"
                "--marker '>'"
                "--gutter ' '"
                "--preview-window hidden:border-sharp"

                # TODO: Make only available if bat is installed
                "--preview 'bat --style=numbers --color=always --line-range:500 {}'"
                "--bind alt-p:toggle-preview"
            ];
        };
    };

    flake.modules.homeManager.zsh = {
        programs.fzf.enableZshIntegration = true;
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
    in {
        programs.fzf.defaultOptions = [
            "--color fg:${colors.muted.hex},fg+:${colors.fg.hex},bg:-1,bg+:${colors.surface.hex},gutter:-1"
            "--color hl:${colors.accent.hex},hl+:${colors.accent.hex},info:${colors.muted.hex},marker:${colors.purple.hex}"
            "--color prompt:${colors.accent.hex},spinner:${colors.accent.hex},pointer:${colors.accent.hex}"
            "--color border:${colors.muted.hex},query:${colors.fg.hex}"
        ];
    };
}
