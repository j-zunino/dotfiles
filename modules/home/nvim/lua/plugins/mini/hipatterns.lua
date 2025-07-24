local colors = require('silly.colors')
local tailwind = require('silly.tailwind')

return {
    require('mini.hipatterns').setup({
        highlighters = vim.tbl_extend('force', {
            fix = {
                pattern = '%f[%w]()FIX%f[%W].()',
                group = 'DiagnosticVirtualTextError',
            },
            fixme = {
                pattern = '%f[%w]()FIXME%f[%W].()',
                group = 'DiagnosticVirtualTextError',
            },
            hack = {
                pattern = '%f[%w]()HACK%f[%W].()',
                group = 'DiagnosticVirtualTextWarn',
            },
            warn = {
                pattern = '%f[%w]()WARN%f[%W].()',
                group = 'DiagnosticVirtualTextWarn',
            },
            warning = {
                pattern = '%f[%w]()WARNING%f[%W].()',
                group = 'DiagnosticVirtualTextWarn',
            },
            todo = {
                pattern = '%f[%w]()TODO%f[%W].()',
                group = 'DiagnosticVirtualTextInfo',
            },
            note = {
                pattern = '%f[%w]()NOTE%f[%W].()',
                group = 'DiagnosticVirtualTextHint',
            },
        }, colors.extend(), tailwind.extend()),
    }),
}
