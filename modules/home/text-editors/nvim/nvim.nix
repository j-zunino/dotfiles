{ pkgs, ... }:

{
    programs.neovim.enable = true;
    xdg.configFile.nvim.source = ../nvim;

    home = {
        packages = with pkgs; [
            stylua
            nodePackages.prettier
        ];

        file."/home/juan/dotfiles/.stylua.toml".text = ''
            indent_type = "Spaces"
            indent_width = 4
            column_width = 80
            quote_style = "AutoPreferSingle"
        '';

        file.".prettierrc.toml" = {
            text = ''
                # .prettierrc.toml
                tabWidth = 4
                semi = true
                singleQuote = true
                useTabs = false
                quoteProps = "consistent"
                trailingComma = "none"
                bracketSpacing = true
                bracketSameLine = false
            '';
        };
    };
}
