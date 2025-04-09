local M = {}

local namespace_id = vim.api.nvim_create_namespace('SillySearchIndex')
local extmark_id = nil
local last_line = nil
local last_update = 0
local debounce_delay = 50

local function get_current_match_line()
    local pattern = vim.fn.getreg('/')
    local pos = vim.fn.searchpos(pattern, 'cnW')
    return pos[1]
end

M.show_search_index = function()
    local count = vim.fn.searchcount({ maxcount = 0 })
    if count.total == 0 or vim.v.hlsearch == 0 then
        M.clear_search_index()
        return
    end

    local match_line = get_current_match_line()
    if match_line == 0 then
        M.clear_search_index()
        return
    end

    if last_line == match_line then
        return
    end

    M.clear_search_index()

    local ok, new_extmark_id = pcall(
        vim.api.nvim_buf_set_extmark,
        0,
        namespace_id,
        match_line - 1,
        0,
        {
            virt_text = {
                {
                    string.format('[%d/%d]', count.current, count.total),
                    'DiagnosticVirtualTextInfo',
                },
            },
            virt_text_pos = 'eol',
            right_gravity = false,
        }
    )

    if ok then
        extmark_id = new_extmark_id
        last_line = match_line
    else
        extmark_id = nil
        last_line = nil
        vim.notify('Error setting search index extmark', vim.log.levels.ERROR)
    end
end

M.clear_search_index = function()
    if extmark_id then
        pcall(vim.api.nvim_buf_del_extmark, 0, namespace_id, extmark_id)
        extmark_id = nil
    end
    vim.api.nvim_buf_clear_namespace(0, namespace_id, 0, -1)
    last_line = nil
end

-- Autocommands
local group =
    vim.api.nvim_create_augroup('SillySearchIndexAu', { clear = true })

local function handle_search_index_update()
    if not (vim.opt.hlsearch:get() and vim.fn.mode():find('[nc]')) then
        M.clear_search_index()
        return
    end

    local current_time = vim.loop.now()
    if current_time - last_update <= debounce_delay then
        return
    end

    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local match_line = get_current_match_line()

    if match_line ~= 0 and current_line == match_line then
        M.show_search_index()
        last_update = current_time
    else
        M.clear_search_index()
    end
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'ModeChanged' }, {
    group = group,
    pattern = '*',
    callback = function()
        vim.defer_fn(handle_search_index_update, 10)
    end,
})

vim.api.nvim_create_autocmd('BufLeave', {
    group = group,
    pattern = '*',
    callback = M.clear_search_index,
})

return M
