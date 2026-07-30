{inputs, ...}: {
    flake.modules.homeManager.quickshell = {pkgs, ...}: {
        home.packages = [
            inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };
}
