return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    enabled = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = '<C-e>',
    config = function()
        local neotree = require('neo-tree')

        local function hideCursor()
            vim.cmd("highlight Cursor guibg='NONE' guifg='NONE'")
            vim.cmd('highlight! Cursor blend=100')
            vim.cmd('set guicursor+=a:Cursor/lCursor')
        end

        local function showCursor()
            vim.cmd('highlight! Cursor blend=0')
            vim.cmd('set guicursor+=a:Cursor/lCursor')
        end

        local function getTelescopeOpts(state, path)
            return {
                cwd = path,
                search_dirs = { path },
                attach_mappings = function(prompt_bufnr, map)
                    local actions = require('telescope.actions')
                    actions.select_default:replace(function()
                        actions.close(prompt_bufnr)
                        local action_state = require('telescope.actions.state')
                        local selection = action_state.get_selected_entry()
                        local filename = selection.filename
                        if filename == nil then
                            filename = selection[1]
                        end
                        -- any way to open the file without triggering auto-close event of neo-tree?
                        require('neo-tree.sources.filesystem').navigate(
                            state,
                            state.path,
                            filename
                        )
                    end)
                    return true
                end,
            }
        end

        neotree.setup({
            close_if_last_window = true,
            popup_border_style = 'single',
            use_popups_for_input = true,
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                indent = {
                    indent_size = 4,
                    padding = 1,
                    with_markers = false,
                    with_expanders = true,
                },
                modified = {
                    symbol = ' ',
                    highlight = 'NeoTreeModified',
                },
                name = {
                    trailing_slash = true,
                    use_git_status_colors = true,
                    highlight = 'NeoTreeFileName',
                },
                git_status = {
                    symbols = {
                        added = '✚ ',
                        modified = ' ',
                        deleted = '✖ ',
                        renamed = ' ',
                        untracked = ' ',
                        ignored = ' ',
                        unstaged = ' ',
                        staged = ' ',
                        conflict = ' ',
                    },
                },
                file_size = {
                    enabled = false,
                },
                type = {
                    enabled = false,
                },
                last_modified = {
                    enabled = false,
                },
                created = {
                    enabled = false,
                },
                symlink_target = {
                    enabled = false,
                },
            },
            commands = {
                telescope_find = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    require('telescope.builtin').find_files(
                        getTelescopeOpts(state, path)
                    )
                end,
                telescope_grep = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    require('telescope.builtin').live_grep(
                        getTelescopeOpts(state, path)
                    )
                end,
            },
            event_handlers = {
                {
                    event = 'neo_tree_buffer_enter',
                    handler = function()
                        hideCursor()
                    end,
                },
                {
                    event = 'neo_tree_popup_buffer_leave',
                    handler = function()
                        hideCursor()
                    end,
                },

                {
                    event = 'neo_tree_buffer_leave',
                    handler = function()
                        showCursor()
                    end,
                },
                {
                    event = 'neo_tree_popup_buffer_enter',
                    handler = function()
                        showCursor()
                    end,
                },
            },
            window = {
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ['<C-e>'] = nil,
                    ['<CR>'] = 'open',
                    ['<SPACE>'] = 'open',
                    ['l'] = 'open',
                    ['<esc>'] = 'cancel',

                    -- [ Telescope - Grep ]
                    ['f'] = 'telescope_find',
                    ['g'] = 'telescope_grep',

                    ['P'] = {
                        'toggle_preview',
                        config = { use_float = true, use_image_nvim = false },
                    },
                    ['s'] = 'open_split',
                    ['v'] = 'open_vsplit',
                    ['U'] = 'toggle_preview',
                    ['C'] = 'close_node',
                    ['z'] = 'close_all_nodes',
                    ['Z'] = 'expand_all_nodes',
                    ['a'] = {
                        'add',
                        config = {
                            show_path = 'none',
                        },
                    },
                    ['A'] = 'add_directory',
                    ['d'] = 'delete',
                    ['r'] = 'rename',
                    ['y'] = 'copy',
                    ['Y'] = 'copy_to_clipboard',
                    ['x'] = 'cut_to_clipboard',
                    ['p'] = 'paste_from_clipboard',
                    ['m'] = 'move',
                    ['R'] = 'refresh',
                    ['?'] = 'show_help',
                    ['<'] = 'prev_source',
                    ['>'] = 'next_source',
                    ['i'] = 'show_file_details',
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
                follow_current_file = {
                    enabled = false,
                    leave_dirs_open = false,
                },
                group_empty_dirs = false,
                hijack_netrw_behavior = 'open_default',
                use_libuv_file_watcher = false,
                window = {
                    mappings = {
                        ['<bs>'] = 'navigate_up',
                        ['.'] = 'set_root',
                        ['H'] = 'toggle_hidden',
                        ['/'] = 'fuzzy_finder',
                        ['D'] = 'fuzzy_finder_directory',
                        ['#'] = 'fuzzy_sorter',
                        -- ['f'] = 'filter_on_submit',
                        ['<c-x>'] = 'clear_filter',
                        ['[g'] = 'prev_git_modified',
                        [']g'] = 'next_git_modified',
                        ['o'] = {
                            'show_help',
                            nowait = false,
                            config = { title = 'Order by', prefix_key = 'o' },
                        },
                        ['oc'] = { 'order_by_created', nowait = false },
                        ['od'] = { 'order_by_diagnostics', nowait = false },
                        ['og'] = { 'order_by_git_status', nowait = false },
                        ['om'] = { 'order_by_modified', nowait = false },
                        ['on'] = { 'order_by_name', nowait = false },
                        ['os'] = { 'order_by_size', nowait = false },
                        ['ot'] = { 'order_by_type', nowait = false },
                    },
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                group_empty_dirs = true,
                show_unloaded = true,
                window = {
                    mappings = {
                        ['bd'] = 'buffer_delete',
                        ['<bs>'] = 'navigate_up',
                        ['.'] = 'set_root',
                        ['o'] = {
                            'show_help',
                            nowait = false,
                            config = { title = 'Order by', prefix_key = 'o' },
                        },
                        ['oc'] = { 'order_by_created', nowait = false },
                        ['od'] = { 'order_by_diagnostics', nowait = false },
                        ['om'] = { 'order_by_modified', nowait = false },
                        ['on'] = { 'order_by_name', nowait = false },
                        ['os'] = { 'order_by_size', nowait = false },
                        ['ot'] = { 'order_by_type', nowait = false },
                    },
                },
            },
            git_status = {
                window = {
                    position = 'float',
                    mappings = {
                        ['A'] = 'git_add_all',
                        ['gu'] = 'git_unstage_file',
                        ['ga'] = 'git_add_file',
                        ['gr'] = 'git_revert_file',
                        ['gc'] = 'git_commit',
                        ['gp'] = 'git_push',
                        ['gg'] = 'git_commit_and_push',
                        ['o'] = {
                            'show_help',
                            nowait = false,
                            config = { title = 'Order by', prefix_key = 'o' },
                        },
                        ['oc'] = { 'order_by_created', nowait = false },
                        ['od'] = { 'order_by_diagnostics', nowait = false },
                        ['om'] = { 'order_by_modified', nowait = false },
                        ['on'] = { 'order_by_name', nowait = false },
                        ['os'] = { 'order_by_size', nowait = false },
                        ['ot'] = { 'order_by_type', nowait = false },
                    },
                },
            },
        })

        vim.keymap.set(
            'n',
            '<C-e>',
            '<cmd>Neotree toggle float<CR>',
            { noremap = true, silent = true, desc = 'Toggle file tree' }
        )
        vim.keymap.set(
            'n',
            '<C-t>',
            '<cmd>Neotree toggle right<CR>',
            { noremap = true, silent = true, desc = 'Toggle file tree' }
        )
    end,
}
