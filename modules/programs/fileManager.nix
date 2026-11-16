{inputs, ...}: {
    flake.modules.nixos.fileManager = {...}: {
        services = {
            udisks2.enable = true;
            devmon.enable = true;
            # gvfs.enable = true;
            # tumbler.enable = true;
        };
    };

    flake.modules.homeManager.fileManager = {
        config,
        pkgs,
        lib,
        ...
    }: {
        options.programs.nordend = {
            settings = lib.mkOption {
                type = lib.types.attrsOf lib.types.anything;
                default = {};
                description = "Nordend configuration.";
            };
        };

        config = {
            nixpkgs.overlays = [inputs.nordend.overlays.default];

            home.packages = with pkgs; [
                nordend
                xarchiver
            ];

            xdg = {
                portal = {
                    extraPortals = [pkgs.nordend];
                    config.hyprland = {
                        default = ["hyprland" "gtk"];
                        "org.freedesktop.impl.portal.FileChooser" = ["nordend"];
                    };
                };

                dataFile = {
                    "dbus-1/services/org.freedesktop.FileManager1.service".text = ''
                        [D-BUS Service]
                        Name=org.freedesktop.FileManager1
                        Exec=${pkgs.nordend}/libexec/nordend/nordend-portal --file-manager1
                    '';
                    "dbus-1/services/org.freedesktop.impl.portal.desktop.nordend.service".source = "${pkgs.nordend}/share/dbus-1/services/org.freedesktop.impl.portal.desktop.nordend.service";
                };

                mimeApps = {
                    defaultApplications = {
                        "inode/directory" = "nordend.desktop";
                        "application/x-gnome-saved-search" = "nordend.desktop";
                    };
                };

                configFile = {
                    "nordend/config.toml".source =
                        (pkgs.formats.toml {}).generate
                        "nordend-config.toml"
                        config.programs.nordend.settings;
                };
            };
        };
    };

    flake.modules.homeManager.stylix = {config, ...}: {
        programs.nordend = {
            settings.font = {
                family = config.stylix.fonts.sansSerif.name;
                monospace = config.stylix.fonts.monospace.name;
                size = config.stylix.fonts.sizes.applications;
            };
        };
    };
}
