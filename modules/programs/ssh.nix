{...}: {
    flake.modules.homeManager.ssh = {
        services.ssh-agent.enable = true;
        programs.ssh = {
            enable = true;
            enableDefaultConfig = false;
            matchBlocks = {
                "*" = {
                    extraOptions = {
                        AddKeysToAgent = "yes";
                        ForwardAgent = "no";
                        Compression = "no";
                        ServerAliveInterval = "30";
                        ServerAliveCountMax = "3";
                        HashKnownHosts = "yes";
                        UserKnownHostsFile = "~/.ssh/known_hosts";
                        ControlMaster = "auto";
                        ControlPersist = "10m";
                        ControlPath = "~/.ssh/master-%r@%n:%p";
                    };
                };

                "sputnik" = {
                    hostname = "192.168.0.209";
                    user = "sputnik";
                    port = 2005;
                    identityFile = "~/.ssh/id_sputnik";
                    extraOptions = {IdentitiesOnly = "yes";};
                };
            };
        };
    };

    flake.modules.homeManager.git = {
        programs.ssh.matchBlocks = {
            "github.com" = {
                extraOptions.ForwardAgent = "yes";
            };
        };
    };
}
