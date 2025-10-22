{config, ...}: let
    colors = config.my.colors;
in {
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;

        defaultOptions = [
            "--keep-right"
            "--smart-case"
            "--margin 2"
            "--info=right"
            "--scrollbar █"
            "--gutter ' '"
            "--preview-window hidden:border-sharp"
            "--preview 'bat --style=numbers --color=always --line-range:500 {}'"

            "--color fg:${colors.gray1-hex},fg+:${colors.fg-hex},bg:-1,bg+:${colors.bg1-hex},gutter:-1"
            "--color hl:${colors.bg2-hex},info:${colors.gray1-hex}"
            "--color prompt:${colors.accent-hex},spinner:${colors.accent-hex},pointer:${colors.accent-hex}"
            "--color border:${colors.gray1-hex},query:${colors.fg-hex}"

            "--bind alt-p:toggle-preview"
        ];
    };
}
