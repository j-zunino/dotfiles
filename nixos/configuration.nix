{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../modules/nixos/default.nix
    ];

    nix = {
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
        };
    };

    environment = {
        systemPackages = with pkgs; [
            vim
            xclip
            xsel

            # [ DMENU ]
            (pkgs.dmenu.overrideAttrs (oldAttrs: {
                src = /home/juan/dmenu;
            }))
        ];
    };

    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "24.05";
}
