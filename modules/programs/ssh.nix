{...}: {
    flake.modules.nixos.sshServer = {
        services = {
            fail2ban = {
                enable = true;
                jails.sshd.enabled = true;
            };

            endlessh = {
                enable = true;
                port = 22;
                openFirewall = true;
            };

            openssh = {
                enable = true;
                ports = [2005];
                settings = {
                    X11Forwarding = false;
                    IgnoreRhosts = true;
                    PermitEmptyPasswords = false;
                    MaxAuthTries = 3;
                    PubKeyAuthentication = true;
                    PasswordAuthentication = false;
                    PermitRootLogin = "no";
                    KbdInteractiveAuthentication = false;
                    AllowUsers = ["juan"];
                };
            };
        };
    };

    flake.modules.homeManager.ssh = {
        services.ssh-agent.enable = true;
        programs.ssh = {
            enable = true;
            enableDefaultConfig = false;
            settings = {
                "*" = {
                    AddKeysToAgent = "yes";
                    ForwardAgent = "no";
                    Compression = "no";
                    ServerAliveInterval = 30;
                    ServerAliveCountMax = 3;
                    HashKnownHosts = "yes";
                    UserKnownHostsFile = "~/.ssh/known_hosts";
                    ControlMaster = "auto";
                    ControlPersist = "10m";
                    ControlPath = "~/.ssh/master-%r@%n:%p";
                };

                "sputnik" = {
                    HostName = "192.168.0.209";
                    User = "sputnik";
                    Port = 2005;
                    IdentityFile = "~/.ssh/id_sputnik";
                    IdentitiesOnly = "yes";
                };

                "desktop" = {
                    HostName = "192.168.0.185";
                    User = "juan";
                    Port = 2005;
                    IdentityFile = "~/.ssh/id_desktop";
                    IdentitiesOnly = "yes";
                };

                "github.com" = {
                    ForwardAgent = "yes";
                };
            };
        };
    };
}
