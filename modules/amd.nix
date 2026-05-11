{...}: {
  flake.modules.nixos.cpu-amd = {
    boot.kernelParams = ["amd_pstate=active"];
  };
}
