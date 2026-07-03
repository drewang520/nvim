return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      win = {
        border = "rounded",
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "缓冲区快捷键提示",
      },
    },
      -- local wk = require("which-key")
      -- wk.add({
      --     {"<leader>f", group = "find (Telescope)"},
      --     { "<leader>v", group = "配置文件" },
      --     { "<leader>p", group = "插件管理" },
      --     { "<leader>h", group = "Git Hunk" },
      -- }),
  },
}
