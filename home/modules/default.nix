{
    hostname,
    lib,
    ...
}: {
    imports =
        [
            ./git.nix
            ./nvim.nix
            ./btop.nix
            ./zsh.nix
            ./scripts
            ./fastfetch.nix
            ../../nixos/stylix.nix
            ./zoxide.nix
            ./aichat.nix
            ./ssh.nix
            ./fzf.nix
            ./tmux.nix
            ./stylix.nix
        ]
        ++ lib.optionals (hostname != "wsl") [
            ./spicetify.nix
            ./hypr
            ./wezterm.nix
            ./rofi.nix
            ./browser.nix
            ./mako.nix
        ];
}
