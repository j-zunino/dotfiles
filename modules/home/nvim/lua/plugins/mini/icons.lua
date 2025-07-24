local dir = { glyph = '󰉋', hl = 'Function' }

return {
    require('mini.icons').setup({

        require('mini.icons').mock_nvim_web_devicons(),

        default = {
            directory = dir,
        },
        directory = {
            ['.git'] = dir,
            ['.github'] = dir,
            Desktop = dir,
            Library = dir,
            Network = dir,
            Public = dir,
            home = dir,
            lang = dir,
            lib = dir,
            lsp = dir,
            media = dir,
            queries = dir,
            root = dir,
            src = dir,
            snippets = dir,
            syntax = dir,
        },
        extension = {
            html = { glyph = '' },
            json = { glyph = '' },
            json5 = { glyph = '' },
            jsonc = { glyph = '' },
            jsonl = { glyph = '' },
            lock = { glyph = '' },
            md = { glyph = '' },

            js = { glyph = '' },
            ts = { glyph = '' },
            jsx = { glyph = '' },
            tsx = { glyph = '' },

            nix = { glyph = '' },

            jpeg = { glyph = '', hl = 'MiniIconsOrange' },
            jpg = { glyph = '', hl = 'MiniIconsOrange' },
            png = { glyph = '', hl = 'MiniIconsPurple' },
            tif = { glyph = '', hl = 'MiniIconsYellow' },
            tiff = { glyph = '', hl = 'MiniIconsYellow' },
            webp = { glyph = '', hl = 'MiniIconsBlue' },
        },
        file = {
            README = { glyph = '', hl = 'MiniIconsGray' },
            ['README.md'] = { glyph = '', hl = 'MiniIconsGray' },
            ['README.txt'] = { glyph = '', hl = 'MiniIconsGray' },
            TODO = { glyph = '' },
            ['TODO.md'] = { glyph = '' },
        },
    }),
}
