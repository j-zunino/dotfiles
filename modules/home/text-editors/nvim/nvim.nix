{ config, pkgs, ... }:

{
    programs.neovim.enable = true;
    xdg.configFile.nvim.source = ../nvim;

    home = {
        packages = with pkgs; [
            stylua
        ];

        file."/home/juan/dotfiles/.stylua.toml".text = ''
            indent_type = "Spaces"
            indent_width = 4
            column_width = 80
            quote_style = "AutoPreferSingle"
        '';

    };
}
