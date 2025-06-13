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
                    group = 'MiniStatuslineModeOther',
                },
                fix = {
                    pattern = '().%f[%w]FIX%f[%W].()',
                    group = 'MiniHipatternsFixme',
                },
                fixme = {
                    pattern = '().%f[%w]FIXME%f[%W].()',
                    group = 'MiniHipatternsFixme',
                },
                hack = {
                    pattern = '().%f[%w]HACK%f[%W].()',
                    group = 'MiniHipatternsHack',
                },
                warning = {
                    pattern = '().%f[%w]WARNING%f[%W].()',
                    group = 'MiniHipatternsHack',
                },
                todo = {
                    pattern = '().%f[%w]TODO%f[%W].()',
                    group = 'MiniHipatternsNote',
                },
                note = {
                    pattern = '().%f[%w]NOTE%f[%W].()',
                    group = 'MiniHipatternsTodo',
                },
            },
        })
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
        })
    end,
}
