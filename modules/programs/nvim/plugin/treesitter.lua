vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then
                vim.cmd.packadd('nvim-treesitter')
            end
            vim.cmd('TSUpdate')
        end
    end,
})

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/windwp/nvim-ts-autotag',
    'https://github.com/axelvc/template-string.nvim',
})

local parsers = {
    'c',
    'css',
    'html',
    'javascript',
    'jsx',
    'lua',
    'markdown',
    'nix',
    'tsx',
    'typescript',
}

require('nvim-treesitter').install(parsers)

local function treesitter_try_attach(buf, language)
    if not vim.treesitter.language.add(language) then
        return
    end
    vim.treesitter.start(buf, language)

    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'

    local has_indent_query = vim.treesitter.query.get(language, 'indents')
        ~= nil

    if has_indent_query then
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
end

local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
            return
        end

        local installed_parsers =
            require('nvim-treesitter').get_installed('parsers')

        if vim.tbl_contains(installed_parsers, language) then
            treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            require('nvim-treesitter').install(language):await(function()
                treesitter_try_attach(buf, language)
            end)
        else
            treesitter_try_attach(buf, language)
        end
    end,
})

require('nvim-ts-autotag').setup()

require('template-string').setup({
    jsx_brackets = true,
    remove_template_string = true,
    restore_quotes = {
        normal = [[']],
    },
})
