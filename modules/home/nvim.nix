{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim.enable = true;
  xdg.configFile.nvim.source = ./nvim;

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  home = {
    packages = with pkgs; [
      # Language Servers
      vscode-langservers-extracted
      tailwindcss-language-server
      typescript-language-server
      lua-language-server
      lua51Packages.lua
      python313
      emmet-ls
      vtsls
      nixd

      # Formatters & Linters
      prettierd
      alejandra
      eslint_d
      stylua

      # Compilers
      gnumake
      gcc

      # Development Tools
      nodejs
      cargo
      pnpm

      # Tools
      editorconfig-checker
      imagemagick
      tty-clock
      luarocks
      chafa
      vale
      fd
    ];

    file."alejandra.toml".text = ''
      indentation = "FourSpaces"
    '';

    file.".editorconfig" = {
      text = ''
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
