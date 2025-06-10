return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        local dir = { glyph = '󰉋', hl = 'Function' }

        require('mini.pairs').setup()
        require('mini.surround').setup()
        require('mini.ai').setup({ n_lines = 80 })
        require('mini.hipatterns').setup({
            highlighters = {
                perf = {
                    pattern = '().%f[%w]PERF%f[%W].()',
                    group = 'MiniIconsPurple',
                },
                fix = {
                    pattern = '().%f[%w]FIX%f[%W].()',
                    group = 'MiniIconsRed',
                },
                fixme = {
                    pattern = '().%f[%w]FIXME%f[%W].()',
                    group = 'MiniIconsRed',
                },
                hack = {
                    pattern = '().%f[%w]HACK%f[%W].()',
                    group = 'MiniIconsYellow',
                },
                warning = {
                    pattern = '().%f[%w]WARNING%f[%W].()',
                    group = 'MiniIconsYellow',
                },
                todo = {
                    pattern = '().%f[%w]TODO%f[%W].()',
                    group = 'MiniIconsBlue',
                },
                note = {
                    pattern = '().%f[%w]NOTE%f[%W].()',
                    group = 'MiniIconsGreen',
                },
            },
        })
        require('mini.icons').setup({
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
        })
    end,
}
