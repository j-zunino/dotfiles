{pkgs, ...}: {
    imports = [
        ./hardware-configuration.nix
        ../modules/nixos/default.nix
    ];

    nix = {
        settings = {
            experimental-features = ["nix-command" "flakes"];
            download-buffer-size = 524288000;
        };
    };

    environment = {
        systemPackages = with pkgs; [
            vim
        ];
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "24.05";
}
