{ config, ... }:

{
  programs.vscode = {
    enable = true;
        #userSettings = { ./settings.json };
        #keybindings = { ./keybindings.json };
  };
}

