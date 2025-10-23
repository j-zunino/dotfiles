{
    inputs,
    pkgs,
    ...
}: {
    programs.brave = {
        enable = true;
        extensions = [
            {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
            {id = "fmkadmapgofadopljbjfkapdkoienihi";} # React developer tools
            {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium C
            {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # Dark reader
            {id = "edibdbjcniadpccecjdfdjjppcpchdlm";} # I still don't care about cookies
        ];
        commandLineArgs = [
            "--enable-blink-features=MiddleClickAutoscroll"
        ];
    };

    home.packages = with pkgs; [
        inputs.zen-browser.packages.${pkgs.system}.default
    ];

    # imports = [inputs.zen-browser.homeModules.beta];
    # programs.zen-browser = {
    #     enable = true;
    #     policies = {
    #         ExtensionSettings = {
    #             "uBlock0@raymondhill.net" = {
    #                 install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    #                 installation_mode = "force_installed";
    #             };
    #             "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
    #                 install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
    #                 installation_mode = "force_installed";
    #             };
    #             "addon@darkreader.org" = {
    #                 install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
    #                 installation_mode = "force_installed";
    #             };
    #             "idcac-pub@guus.ninja" = {
    #                 install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
    #                 installation_mode = "force_installed";
    #             };
    #             "vimium-c@gdh1995.cn" = {
    #                 install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
    #                 installation_mode = "force_installed";
    #             };
    #         };
    #     };
    # };
}
