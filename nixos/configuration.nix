{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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

  # Auto-update
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-24.05";
  };

  nix = {
    settings = {
      # auto-optimise-store = true;
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

  # Set your time zone
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties
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

    displayManager.sddm.enable = true;

    printing.enable = true;

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
        dwm.enable = true;

        dwm.package = pkgs.dwm.overrideAttrs {
        src = /home/juan/dwm; # Put the path to your dwm config here.
        };
      };

      displayManager = {
        defaultSession = "none+dwm";

        autoLogin.enable = true;
        autoLogin.user = "juan";
      };


      layout = "latam";
      xkbVariant = "";

      # Touchpad support
      # libinput.enable = true;
    };
  };

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Define a user account
  users.users.juan = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
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
      # [ DWM ]
      dmenu
      st
    ];
  };

  fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    (nerdfonts.override { fonts = [ "CascadiaCode" "FiraCode" ]; })
  ];

  system.stateVersion = "24.05";
}
