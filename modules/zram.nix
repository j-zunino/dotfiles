{...}: {
  flake.modules.nixos.zram = {config, ...}: {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = config.zram.percent; # TODO: Create this lol
    };
  };
}
