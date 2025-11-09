{
    pkgs,
    inputs,
    ...
}: {
    home.packages = with pkgs; [
        prismlauncher
        piper
        gpu-screen-recorder
        mangohud
        inputs.affinity-nix.packages.x86_64-linux.v3
    ];
}
