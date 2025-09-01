return {
    cmd = { 'nixd' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', 'git' },
    settings = {
        nixd = {
            nixpkgs = {
                expr = 'import <nixpkgs> { }',
            },
            formatting = {
                command = { 'alejandra' },
            },
        },
        options = {
            nixos = {
                expr = '(builtins.getFlake "$HOME/dotfiles/flake.nix").nixosConfigurations.CONFIGNAME.options',
            },

            home_manager = {
                expr = '(builtins.getFlake "$HOME/dotfiles/flake.nix").homeConfigurations.CONFIGNAME.options',
            },
        },
    },
}
