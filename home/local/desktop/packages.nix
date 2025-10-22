{pkgs, ...}: {
    home.packages = with pkgs; [
        prismlauncher
        piper
        gpu-screen-recorder
    ];
}
