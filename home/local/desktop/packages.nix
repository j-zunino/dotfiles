{pkgs, ...}: {
    home.packages = with pkgs; [
        prismlauncher
        piper
    ];
}
