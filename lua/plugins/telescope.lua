return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        config = function()
          local telescope = require('telescope')
          telescope.setup({
            defaults = {
              mappings = {
                i = {
                  ['<C-j>'] = 'move_selection_next',
                  ['<C-k>'] = 'move_selection_previous',
                },
              },
            },
          })

          -- 快捷键
          local map = vim.keymap.set
          map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
          map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
          map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
          map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
          map('n', '<leader>fs', '<cmd>Telescope lsp_workspace_symbols<CR>')
          map('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>')
        end,
        dependencies = {'nvim-lua/plenary.nvim'},
    },
}

