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
            ../../nixos/stylix.nix
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
            ./mpv.nix
            ./xdg.nix
            ./drives.nix
        ];
}
