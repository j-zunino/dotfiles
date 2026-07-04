{...}: {
    flake.modules.nixos.desktop = {
        fileSystems."/mnt/games-win" = {
            device = "/dev/disk/by-uuid/7C78EE9F78EE5782";
            fsType = "ntfs";
            options = [
                "defaults"
                "nofail"
                "x-gvfs-show"
                "uid=1000"
                "gid=100"
                "dmask=022"
                "fmask=133"
            ];
        };

        fileSystems."/mnt/wd" = {
            device = "/dev/disk/by-uuid/51e2c8ae-eb73-4ba7-b436-aaec4307e1dd";
            fsType = "ext4";
            options = [
                "defaults"
                "nofail"
                "x-gvfs-show"
            ];
        };
    };
}
