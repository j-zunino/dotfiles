{ ... }:

{
    programs.btop = {
        enable = true;
        settings = {
            vim_keys = true;
            rounded_corners = false;
            temp_scale = "celcius";
            show_battery = true;
        };
    };
}
