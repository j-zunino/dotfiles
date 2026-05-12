{inputs, ...}: {
    flake.modules.homeManager.gimp = {pkgs, ...}: {
        home.packages = with pkgs; [
            gimp
        ];
    };

    flake.modules.homeManager.affinity = {pkgs, ...}: {
        nixpkgs.overlays = [inputs.affinity-nix.overlays.default];

        home.packages = with pkgs; [
            affinity-v3
        ];
    };
}
