{
    pkgs,
    user,
    ...
}: {
    programs.zsh.enable = true;

    fonts.packages = with pkgs.nerd-fonts; [
        jetbrains-mono
        iosevka-term
    ];

    users = {
        defaultUserShell = pkgs.zsh;
        users.${user} = {
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel"];
            initialPassword = "password";
        };
    };
}
