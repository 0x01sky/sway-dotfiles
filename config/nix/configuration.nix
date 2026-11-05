{ config, pkgs, ... };

{
  imports = [
    ./hardware-configuration.nix
  #  ./lanzaboote.nix
  ];

  # my hostname
  networking.hostName = "nixos";
  # timezone
  time.timeZone = "Africa/Casablanca";  
  # my user along with groups to make things easier
  users.users.sky = {
    extraGroups = ["wheel" "networkmanager" "dialout" "wireshark"];
    isNormalUser = true;
    mutableUsers = false;
  };
  
  # Enabling firewall
  networking.firewall.enable = true;

  # Choosing systemd-boot as a bootloader even tho i hate it, im obligated to use it so i can use lanzaboot for secure boot
  
  bootloader = {
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 5;
    };
  };

  # Setup for Security Enhanced Linux

  boot = {
    kernelPackages = pkgs.linuxPackages_latest_hardened;
    kernelParams = [ "security=selinux" ];
    kernelPatches = [ {
        name = "selinux-config";
        patch = null;
        extraConfig = ''
                SECURITY_SELINUX y
                SECURITY_SELINUX_BOOTPARAM n
                SECURITY_SELINUX_DISABLE n
                SECURITY_SELINUX_DEVELOP y
                SECURITY_SELINUX_AVC_STATS y
                SECURITY_SELINUX_CHECKREQPROT_VALUE 0
                DEFAULT_SECURITY_SELINUX n
              '';
        } ];
  };

  systemd.package = pkgs.systemd.override { withSElinux = true; };
  
  # enabling git by default with a credential helper called libsecret along with gnome keyring 
  programs.git = {
    enable = true;
    package = pkgs.git.override { withLibsecret = true; };
    settings = {
      credential.helper = "libsecret";
    }
  }
  
  # Allowing unfree softwares
  nixpkgs.config.allowUnfree = true;

  enviromnent.systemPackages = with pkgs; [
      unstable.codium
      obsidian
      unstable.librewolf-bin
      onlyoffice-desktopeditors
      lazygit
      wl-clipboard
      swaynotificationcenter
      sddm-astronaut
      rustc
      cargo
      python315
      arduino-ide
      inkscape
      kdePackages.kdenlive
      wlogout
      rofi
      distrobox
      ghostty
      gnumake
      clang
      go
      keepassxc
      vesktop
      obs-studio
      mysql-workbench
      mycli
      flameshot
      sbctl
      policycoreutils
      virtualboxHardened
  ];
  
  # Greeter (SDDM in my case)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Enabling wayland protocol for sddm
    theme = "sddm-astronaut"
  };
  
  # Enabling brightness control
  programs.light.enable = true;


  # Gnome keyring (required to store secrets)
  services.gnome.gnome-keyring.enable = true;

  # Enable fprintd for fingerprints
  services.fprintd.enable = true;

  # Stopping sddm from fingerprint's prompts
  security.pam.services.login.fprintAuth = false;

  # Using Swaywm as i like it
  programs.sway {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  
  # Hardware Graphics for Intel Iris Xe Graphics
  hardware.graphics ={
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
      intel-compute-runtime
    ];
  };
  
  # Helpful if ffpmeg init fails
  hardware.enableRedistributableFirmware = true;

  # disabling and enabling services
  services = {
    openssh.enable = false;
    cups.enable = false;
    bluetooth.enable = false;
    mysql = {
      enable = true;
      package = pkgs.mysql84;
    };
  };

}
