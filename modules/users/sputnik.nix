{inputs, ...}: {
    flake.modules.nixos.users-sputnik = {pkgs, ...}: {
        users.users.sputnik = {
            isNormalUser = true;
            extraGroups = ["wheel"];
            shell = pkgs.zsh;
            # openssh.authorizedKeys.keys = [""];
        };
    };

    flake.modules.homeManager.users-sputnik = {
        imports = [inputs.self.modules.homeManager.identity];

        home = {
            username = "sputnik";
            homeDirectory = "/home/sputnik";
            stateVersion = "24.05";
        };
    };
}
