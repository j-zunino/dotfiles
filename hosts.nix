{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        self.modules.nixos.desktop
      ];
    };

    # latitude = inputs.nixpkgs.lib.nixosSystem {
    #     specialArgs = {inherit inputs;};
    #     modules = [
    #         self.modules.nixos.latitude
    #     ];
    # };
  };

  flake.modules.nixos.desktop = {
    networking.name = "desktop";

    imports = with self.modules.nixos; [
      users-juan
      home-manager
      common-settings
      dualboot

      # Hardware
      gpu-nvidia
      cpu-amd

      # Services
      driveMounting
      ethernet
      audio
      zram
    ];
  };

  flake.modules.homeManager.desktop = {
    imports = with self.modules.homeManager; [
      users-juan
      common-settings

      # Programs
      zen
      helium

      # Dev
      terminal
      git
    ];

    wayland.windowManager.mango.extraSettings = ''
      exec-once=spotify
      exec-once=webcord -m

      monitorrule=name:HDMI-A-1,width:1360,height:768,refresh:60,x:0,y:0,scale:1
      monitorrule=name:DP-1,width:1920,height:1080,refresh:60,x:1360,y:0,scale:1
      windowrule=tags:9,appid:spotify
    '';
  };
}
