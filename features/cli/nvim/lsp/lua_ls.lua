return {
    settings = {
        Lua = {
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim', 'love' } },
            completion = { callSnippet = 'Replace' },
            workspace = { library = { '${3rd}/love2d/library' } },
        },
    },
}
