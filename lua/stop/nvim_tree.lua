return {
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
              -- 过滤文件
              filters = {
                dotfiles = false,          -- 显示 . 开头的文件
                custom = { '^.git$' },
              },
              -- 图标
              renderer = {
                icons = {
                  show = {
                    git = true,
                    folder = true,
                    file = true,
                    folder_arrow = true,
                  },
                  glyphs = {
                    default = '',
                    symlink = '',
                    folder = {
                      default = '',
                      open = '',
                      empty = '',
                      empty_open = '',
                      symlink = '',
                    },
                    git = {
                      unstaged = '✗',
                      staged = '✓',
                      unmerged = '',
                      renamed = '➜',
                      untracked = '★',
                      deleted = '',
                      ignored = '◌',
                    },
                  },
                },
              },
              -- 快捷键（可以借鉴原仓库的映射）
              on_attach = function(bufnr)
                local api = require('nvim-tree.api')
                local function opts(desc)
                  return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true }
                end

                -- 常用快捷键
                -- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
                -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
                -- vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
                -- vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
                -- vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
                -- vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
                -- vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
                -- vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
                -- vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
                -- vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
                -- vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
                -- vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
                -- vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
                -- vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
                -- vim.keymap.set('n', 'bmv', api.fs.move, opts('Move'))
                -- vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
                -- vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
                -- vim.keymap.set('n', 'e', api.tree.toggle_ignored, opts('Toggle Ignored'))
                -- vim.keymap.set('n', 'f', api.live_filter, opts('Live Filter'))
                -- vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
                -- vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
                -- vim.keymap.set('n', 'H', api.tree.toggle_dotfiles, opts('Toggle Dotfiles'))
                -- vim.keymap.set('n', 'I', api.tree.toggle_gitignore, opts('Toggle Git Ignore'))
                -- vim.keymap.set('n', 'J', api.node.navigate.last, opts('Last Sibling'))
                -- vim.keymap.set('n', 'K', api.node.navigate.first, opts('First Sibling'))
                -- vim.keymap.set('n', 'L', api.node.open.toggle_group_empty, opts('Toggle Group Empty'))
                -- vim.keymap.set('n', 'm', api.fs.rename, opts('Rename'))
                -- vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
                -- vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
                -- vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
                -- vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
                -- vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
                -- vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
                -- vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
                -- vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
                -- vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
                -- vim.keymap.set('n', 'u', api.fs.rename_full, opts('Rename: Full Path'))
                -- vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse All'))
                -- vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
                -- vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
                -- vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
                -- vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
                -- vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
              end,
            })
                -- 快捷键切换文件树（参考原仓库的可能为 <leader>e 或 <C-n>）
                vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
                vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus file tree' })
          end,
          dependencies = {'nvim-tree/nvim-web-devicons'}
    },
}

