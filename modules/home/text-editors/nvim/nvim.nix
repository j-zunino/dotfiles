{ pkgs, ... }:

{
    programs.neovim.enable = true;
    xdg.configFile.nvim.source = ../nvim;

    home = {
        packages = with pkgs; [
            # lua
            lua51Packages.lua
            luarocks
            stylua
            nodePackages_latest.prettier
            prettierd
            lua-language-server
            typescript
            typescript-language-server
            lazygit
            emmet-ls
            eslint_d
            vscode-langservers-extracted
            tailwindcss-language-server
            python313
            vale
            chafa
            tty-clock
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
