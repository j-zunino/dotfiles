return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    config = function()
        require('render-markdown').setup({
            file_types = { 'markdown' },

            sign = {
                enabled = false,
            },

            heading = {
                icons = { '󰬺 ', '󰬻 ', '󰬼 ', '󰬽 ', '󰬾 ', '󰬿 ' },
                position = 'inline',
                left_pad = 1,
                border = true,

                backgrounds = { 'ColorColumn' },
            },

            code = {
                width = 'block',
                border = 'thin',
                right_pad = 1,
                language_pad = 1,
                min_width = 80,

                highlight = 'ColorColumn',
            },
        })
    end,
}
