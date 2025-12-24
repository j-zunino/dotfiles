{
    lib,
    pkgs,
    config,
    ...
}: {
    home.packages = [
        pkgs.aichat
    ];

    config = lib.mkIf config.features.cli.aichat {
        xdg.configFile."aichat/config.yaml".text = ''
            model: gemini
            clients:
            - type: gemini
              api_key: null # api_key comes from $GEMINI_API_KEY env var
              patch:
                chat_completions:
                  '.*':
                    body:
                      safetySettings:
                        - category: HARM_CATEGORY_HARASSMENT
                          threshold: BLOCK_NONE
                        - category: HARM_CATEGORY_HATE_SPEECH
                          threshold: BLOCK_NONE
                        - category: HARM_CATEGORY_SEXUALLY_EXPLICIT
                          threshold: BLOCK_NONE
                        - category: HARM_CATEGORY_DANGEROUS_CONTENT
                          threshold: BLOCK_NONE
            stream: true
            save: true
            keybindings: vi
        '';
    };
}
