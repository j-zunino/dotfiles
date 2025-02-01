return {
    'ravibrock/spellwarn.nvim',
    lazy = true,
    event = {
        'InsertLeave',
    },
    config = function()
        require('spellwarn').setup({
            enable = true,
            ft_config = {
                alpha = false,
                help = false,
                lazy = false,
                lspinfo = false,
                mason = false,
            },
            ft_default = true,
            max_file_size = nil,
            severity = {
                spellbad = 'WARN',
                spellcap = 'HINT',
                spelllocal = 'HINT',
                spellrare = 'INFO',
            },
            prefix = 'Unknown word: ',
            diagnostic_opts = { severity_sort = true },
        })
    end,
}
