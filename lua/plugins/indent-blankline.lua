return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = 'VeryLazy',
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,       -- 高亮当前代码块的缩进线
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "dashboard", "NvimTree", "lazy", "mason" },
      },
    })

    -- 缩进线颜色，柔和不抢眼
    vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#3b3f4c' })
    vim.api.nvim_set_hl(0, 'IblScope', { fg = '#61AFEF' })  -- 当前作用域缩进线高亮
  end,
}

