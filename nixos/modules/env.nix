{pkgs, ...}: {
    environment = {
        systemPackages = with pkgs; [vim home-manager];
        # sessionVariables = {};
    };
}
