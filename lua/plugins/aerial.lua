return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        backends = { "lsp", "treesitter", "markdown", "man" },
        layout = {
          max_width = { 40, 0.2 },
          width = 35,
          default_direction = "right",
        },
        show_guides = true,
        filter_kind = false, -- 显示所有符号种类，不过滤
        icons = {
          Class = " ",
          Function = " ",
          Method = " ",
          Variable = " ",
          Constant = " ",
          Struct = " ",
        },
        on_attach = function(bufnr)
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = '上一个符号' })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = '下一个符号' })
        end,
      })

      vim.keymap.set('n', '<leader>t', '<cmd>AerialToggle!<CR>', { desc = '切换大纲侧栏' })
    end,
  },
}

