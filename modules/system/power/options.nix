{inputs, ...}: {
    flake.modules.nixos.power-options = {
        imports = [inputs.self.modules.generic.power];
    };
}
