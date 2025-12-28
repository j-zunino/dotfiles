{
    pkgs,
    user,
    ...
}: {
    fonts.packages = with pkgs.nerd-fonts; [
        jetbrains-mono
        iosevka-term
    ];

    programs.zsh.enable = true;
    users = {
        defaultUserShell = pkgs.zsh;
        users.${user} = {
            isNormalUser = true;
            extraGroups = ["networkmanager" "wheel"];
            initialPassword = "password";
        };
    };
}
