{inputs, ...}: {
    config.flake.factory.user = {
        name,
        groups ? ["wheel"],
        stateVersion ? "24.05",
    }: {
        nixos."users-${name}" = {pkgs, ...}: {
            users.users.${name} = {
                isNormalUser = true;
                extraGroups = groups;
                shell = pkgs.zsh;
            };
        };

        homeManager."users-${name}" = {
            imports = [inputs.self.modules.generic.identity];

            home = {
                username = name;
                homeDirectory = "/home/${name}";
                inherit stateVersion;
            };
        };
    };
}
