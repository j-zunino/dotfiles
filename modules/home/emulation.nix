{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      pcsx2
      (retroarch.withCores (cores:
        with cores; [
          citra
          melonds
        ]))
    ];
  };
}
