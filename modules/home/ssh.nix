{...}: {
  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    agentTimeout = "4h";
    extraConfig = ''
      Host *
        AddKeysToAgent yes
    '';
  };
}
