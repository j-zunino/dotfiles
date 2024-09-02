{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system/keyboard.nix
      ./program/gaming.nix
    ];

  # [ Bootloader ]
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
      };

      efi = {
        canTouchEfiVariables = true;
      };

      timeout = 5;
    };
  };

  # [ Auto-update ]
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-24.05";
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # wireless.enable = true; # Enables wireless support via wpa_supplicant
  };

  time.timeZone = "America/Argentina/Buenos_Aires";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "es_AR.UTF-8";
      LC_IDENTIFICATION = "es_AR.UTF-8";
      LC_MEASUREMENT = "es_AR.UTF-8";
      LC_MONETARY = "es_AR.UTF-8";
      LC_NAME = "es_AR.UTF-8";
      LC_NUMERIC = "es_AR.UTF-8";
      LC_PAPER = "es_AR.UTF-8";
      LC_TELEPHONE = "es_AR.UTF-8";
      LC_TIME = "es_AR.UTF-8";
    };
  };

  console = {
    keyMap = "la-latin1";
  };

  services = {
    printing.enable = true;
    dbus.enable = true;
    flatpak.enable = true;

    displayManager = {
      sddm.enable = true;
      defaultSession = "none+dwm";

      autoLogin = {
        enable = true;
        user = "juan";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
    };

    xserver = {
      enable = true;

     desktopManager.plasma5.enable = true;

      windowManager = {
        dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs {
            src = /home/juan/dwm; # Put the path to your dwm dir here.
          };
        };
      };

      xkb = {
        layout = "latam";
        variant = "";
      };
      # Touchpad support
      # libinput.enable = true;
    };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.users.juan = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      git
      vim
      neovim
      alacritty
      xclip
      xsel
      brightnessctl
      # dunst
      # libnotify

      # [ DWM ]
      xorg.libX11
      xorg.xbacklight

      # [ DMENU ]
      (pkgs.dmenu.overrideAttrs (oldAttrs: {
      src = /home/juan/dmenu; # Put the path to your dmenu dir here.
      }))
    ];
  };

  fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    (nerdfonts.override { fonts = [ "CascadiaCode" "FiraCode" ]; })
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
