{
    pkgs,
    lib,
    config,
    ...
}: {
    config = lib.mkIf config.features.dev.dev-pkgs {
        home = {
            packages = with pkgs; [
                # Language Servers
                vscode-langservers-extracted
                tailwindcss-language-server
                typescript-language-server
                lua-language-server
                lua51Packages.lua
                tinymist
                emmet-ls
                pyright
                python3
                vtsls
                nixd

                # Formatters, Linters & Compilers
                prettierd
                alejandra
                typstyle
                eslint_d
                gnumake
                stylua
                typst
                shfmt
                gcc
                jq

                # Other

                editorconfig-checker
                imagemagick
                websocat
                luarocks
                vi-mongo
                posting
                nodejs
                cargo
                pnpm
                vale
                fd
            ];

            file."dotfiles/alejandra.toml".text = ''indentation = "FourSpaces"'';

            file.".editorconfig".text = ''
                root = true

                [*]
                indent_style = space
                indent_size = 4
                tab_width = 4
                end_of_line = lf
                charset = utf-8
                trim_trailing_whitespace = true
                insert_final_newline = true
                max_line_length = 80
                quote_type = single
                spaces_around_brackets = inside
            '';
        };
    };
}
