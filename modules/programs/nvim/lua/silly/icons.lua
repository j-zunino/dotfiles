local MiniPick = require('mini.pick')

local cache_dir = vim.fn.stdpath('cache') .. '/mini/pick/icons'
vim.fn.mkdir(cache_dir, 'p')

local function read_cache(file)
    if vim.fn.filereadable(file) == 1 then
        return vim.json.decode(table.concat(vim.fn.readfile(file), '\n'))
    end
end

local function fetch_json(url, file)
    local cached = read_cache(file)
    if cached then
        return cached
    end

    if vim.fn.executable('curl') == 0 then
        vim.notify('`curl` is required to fetch icons', vim.log.levels.ERROR)
        return {}
    end

    vim.notify('Fetching ' .. url)
    local out = vim.fn.system({ 'curl', '-fsSL', url })
    if vim.v.shell_error ~= 0 then
        vim.notify("Couldn't fetch icons: " .. url, vim.log.levels.ERROR)
        return {}
    end

    vim.fn.writefile({ out }, file)
    return vim.json.decode(out)
end

local function load_icons()
    local items, nerd = {}, {}

    nerd = fetch_json(
        'https://github.com/ryanoasis/nerd-fonts/raw/refs/heads/master/glyphnames.json',
        cache_dir .. '/nerd.json'
    )

    for name, info in pairs(nerd) do
        if name ~= 'METADATA' and info and info.char then
            local _, icon = name:match('^([%w_]+)%-(.*)$')
            if icon then
                table.insert(
                    items,
                    { text = info.char .. ' ' .. icon, data = info.char }
                )
            end
        end
    end

    return items
end

MiniPick.registry.icons = function()
    local items = load_icons()

    return MiniPick.start({
        source = {
            name = 'Icons',
            items = items,
            choose = function(item)
                if not item and item.data then
                    return
                end

                local char = item.data
                vim.schedule(function()
                    vim.fn.setreg('+', char)
                    vim.api.nvim_put({ char }, 'c', false, true)
                end)
            end,
        },
    })
end
