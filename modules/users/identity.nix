{lib, ...}: {
    flake.modules.homeManager.identity = {
        options.my.identity = {
            name = lib.mkOption {
                type = lib.types.str;
                description = "Full name used as the git author identity";
            };
            email = lib.mkOption {
                type = lib.types.str;
                description = "Email used as the git author identity";
            };
        };
    };
}
