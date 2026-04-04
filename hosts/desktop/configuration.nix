{...}: {
    fileSystems."/mnt/wd" = {
        device = "/dev/disk/by-uuid/8062E24362E23E12";
        fsType = "ntfs";
        options = ["rw" "uid=1000" "gid=1000" "umask=0022"];
    };
}
