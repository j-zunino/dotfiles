return {
    cmd = { '/home/juan/.nix-profile/bin/lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = {
                globals = { 'vim', 'love' },
            },
            completion = {
                callSnippet = 'Replace',
            },
            workspace = {
                library = {
                    '${3rd}/love2d/library',
                },
            },
        },
    },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
}
