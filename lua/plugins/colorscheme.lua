return {
  {
    'joshdick/onedark.vim',
    lazy = false,          -- 立即加载
    priority = 1000,       -- 高优先级
    config = function()
      -- onedark 的选项（根据需要）
      vim.g.onedark_enable_italic = 1
      -- vim.g.onedark_transparent_background = 0   -- 先关闭透明测试（如果背景黑色）
      -- 应用主题
      vim.cmd.colorscheme('onedark')
    end,
  },
}



-- return {
  -- add onedark

  -- add gruvbox
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.g.gruvbox_material_transparent_background = 1
  --     vim.g.gruvbox_material_current_word = "underline"
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end,
  -- },

  -- add onedarkpro
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       require('onedarkpro').setup({
  --       styles = {
  --           comments = "bold",
  --           properties = "bold",
  --           functions = "bold",
  --           keywords = "italic",
  --           operators = "bold",
  --           conditionals = "italic",
  --           loops = "italic",
  --           booleans = "bold,italic",
  --       },
  --       options = {
  --           cursorline = false, -- Use cursorline highlighting?
  --           transparency = false, -- Use a transparent background?
  --           terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
  --           lualine_transparency = false, -- Center bar transparency?
  --           highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
  --       },
  --    }),
  --    vim.cmd.colorscheme('onedarkpro')
  --   end,
  -- },
-- }

  -- {
  --   "neanias/everforest-nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("everforest").setup({
  --       transparent_background_level = 1,
  --       inlay_hints_background = "dimmed",
  --     })
  --     vim.cmd.colorscheme('everforest')
  --   end,
  -- },

  -- { 'joshdick/onedark.vim' },
  -- {'sainnhe/gruvbox-material'},
  -- {'olimorris/onedarkpro.nvim'},
  -- { 'ghifarit53/tokyonight-vim' },
  -- { 'morhetz/gruvbox' },
  -- { 'arcticicestudio/nord-vim' },
  -- { 'dracula/vim' },
  -- { 'altercation/vim-colors-solarized' },
  -- { 'tomasr/molokai' },
