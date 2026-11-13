{...}: {
    flake.modules.homeManager.terminal = {
        programs.foot = {
            enable = true;
            settings = {
                main = {pad = "14x14";};
                mouse.hide-when-typing = "yes";
                bell = {
                    system = false;
                    urgent = false;
                    notify = false;
                    visual = false;
                };
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: let
        colors = config.my.colors;
    in {
        programs.foot.settings = {
            "colors-dark" = {
                cursor = "${colors.bg.hexNoPrefix} ${colors.fg.hexNoPrefix}";
            };
        };
    };
}
