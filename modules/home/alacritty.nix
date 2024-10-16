{ pkgs, ... }:

{
    programs = {
        alacritty = {
            enable = true;
            package = pkgs.alacritty;
            settings = {
                font = {
                    size = 9;
                    normal = {
                        family = "CaskaydiaCove Nerd Font";
                        style = "Regular";
                    };
                };

                colors = {
                    primary = {
                        background = "#333c43";
                        foreground = "#d3c6aa";
                    };

                    normal = {
                        black = "#475258";
                        red = "#e67e80";
                        green = "#a7c080";
                        yellow = "#dbbc7f";
                        blue = "#7fbbb3";
                        magenta = "#d699b6";
                        cyan = "#83c092";
                        white = "#d3c6aa";
                    };

                    bright = {
                        black = "#475258";
                        red = "#e67e80";
                        green = "#a7c080";
                        yellow = "#dbbc7f";
                        blue = "#7fbbb3";
                        magenta = "#d699b6";
                        cyan = "#83c092";
                        white = "#d3c6aa";
                    };
                };
            };
        };
    };
}

