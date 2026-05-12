{...}: {
    flake.modules.homeManager.common-cli = {pkgs, ...}: {
        programs.bat.enable = true;
        home.packages = with pkgs; [
            nerdfetch
            ripgrep
            ffmpeg
            unzip
            curl
            wget
            tree
            nmap
            zip
            fd
        ];
    };

    flake.modules.homeManager.dev-cli = {pkgs, ...}: {
        home = {
            packages = with pkgs; [
                editorconfig-checker
                imagemagick
                alejandra
                shfmt
                nixd
                vale
                jq
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

    flake.modules.homeManager.common-gui = {pkgs, ...}: {
        home.packages = with pkgs; [
            gparted
        ];
    };
}
