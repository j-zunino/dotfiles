{lib, ...}: {
    flake.modules.homeManager.identity = {
        options.my.identity = {
            name = lib.mkOption {
                type = lib.types.str;
                default = "j-zunino";
                description = "Full name used as the git author identity";
            };
            email = lib.mkOption {
                type = lib.types.str;
                default = "zuninojuanbautista@gmail.com";
                description = "Email used as the git author identity";
            };
        };
    };
}
