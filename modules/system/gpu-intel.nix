{...}: {
    flake.modules.nixos.gpu-intel = {pkgs, ...}: {
        hardware.graphics = {
            enable = true; # required for the libva driver path; extraPackages alone does nothing
            extraPackages = with pkgs; [
                intel-media-driver # iHD / VA-API
                vpl-gpu-rt # oneVPL, used by recent browsers
                libva-vdpau-driver
            ];
        };

        environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";
        environment.systemPackages = [pkgs.libva-utils]; # vainfo
    };
}
