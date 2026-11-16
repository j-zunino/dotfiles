{...}: {
    flake.modules.nixos.thermal = {
        services.thermald.enable = true;
    };
}
