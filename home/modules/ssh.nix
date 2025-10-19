{...}: {
    services.ssh-agent.enable = true;

    programs.ssh = {
        enable = true;
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

            "github.com" = {
                extraOptions.ForwardAgent = "yes";
            };
        };
    };
}
