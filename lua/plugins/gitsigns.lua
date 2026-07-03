return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = false, -- 想要行尾常驻 blame 信息可以改 true
      current_line_blame_opts = {
        delay = 500,
      },
      on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function opts(desc)
          return { buffer = bufnr, desc = desc }
        end

        -- 跳转 hunk
        vim.keymap.set('n', ']h', gs.next_hunk, opts('下一个变更'))
        vim.keymap.set('n', '[h', gs.prev_hunk, opts('上一个变更'))

        -- 操作 hunk
        vim.keymap.set('n', '<leader>hs', gs.stage_hunk, opts('Stage Hunk'))
        vim.keymap.set('n', '<leader>hr', gs.reset_hunk, opts('Reset Hunk'))
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, opts('Preview Hunk'))
        vim.keymap.set('n', '<leader>hb', function() gs.blame_line({ full = true }) end, opts('Blame Line'))
        vim.keymap.set('n', '<leader>hd', gs.diffthis, opts('Diff This'))

        -- 切换行尾 blame
        vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, opts('Toggle Blame'))
      end,
    },
  },
}

