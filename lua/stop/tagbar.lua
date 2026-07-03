return {
    {
        'preservim/tagbar',
        config = function()
          vim.keymap.set('n', '<leader>t', '<cmd>TagbarToggle<CR>', { silent = true })
          vim.g.tagbar_width = 35
          vim.g.tagbar_autofocus = 1
          vim.g.tagbar_show_linenumbers = 1

          -- 高亮（映射到 lua 的 highlight）
          local set_hl = vim.api.nvim_set_hl
          set_hl(0, 'TagbarKind', { fg = '#D3869B', ctermfg = 175 })
          set_hl(0, 'TagbarSignature', { fg = '#83A598', ctermfg = 109 })
          set_hl(0, 'TagbarPseudoID', { fg = '#928374', ctermfg = 245 })
        end,
    },
}

