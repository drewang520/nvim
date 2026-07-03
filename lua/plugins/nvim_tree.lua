return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        create_in_closed_folder = false,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        --open_on_setup = false,
        --open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        view = {
          width = 30,
          -- hide_root_folder = false,
          side = "left",
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
        },
        renderer = {
          add_trailing = false,
          group_empty = true,
          highlight_git = true,
          highlight_opened_files = "none",
          root_folder_modifier = ":~",
          indent_markers = {
            enable = true,
            icons = {
              corner = "└ ",
              edge = "│ ",
              none = "  ",
            },
          },
          icons = {
            webdev_colors = true,
            git_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              -- default = "",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {},
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 400,
        },
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          expand_all = {
            max_folder_discovery = 300,
          },
          open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
        trash = {
          cmd = "trash",
          require_confirm = true,
        },
        live_filter = {
          prefix = "[FILTER]: ",
          always_show_folders = true,
        },
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
          },
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true }
            end
            api.config.mappings.default_on_attach(bufnr)
            -- 打开、增删改查、剪切粘粘、刷新、关闭、帮助手册
            vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
            vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
            vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
            vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: Net Tab'))
            vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
            vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
            vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
            vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
            vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
            vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
            vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
            vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
            vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))

            -- vim.keymap.set('n', 'H', api.tree.toggle_dotfiles, opts('Toggle Dotfiles'))   -- 显示/隐藏隐藏文件
            -- vim.keymap.set('n', 'I', api.tree.toggle_gitignore, opts('Toggle Git Ignore'))-- 显示/隐藏 gitignore 里的文件
            -- vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))            -- 复制文件名
            -- vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path')) -- 复制绝对路径
            -- vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))         -- 根目录上移一级
            -- vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse All'))        -- 全部折叠，大项目很有用
            -- vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))               -- 树内搜索定位
        end,
      }) -- END_DEFAULT_OPTS
          vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
          vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus file tree' })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    version = "*",
  },
}

