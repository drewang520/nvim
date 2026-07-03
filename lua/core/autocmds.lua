local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local my_group = augroup('MyAutoCmds', { clear = true })

-- 光标最后位置
autocmd('BufReadPost', {
  group = my_group,
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 1 and mark[1] <= lcount then
      vim.cmd('normal! g`"')
    end
  end,
})

-- 帮助文件窗口移到右侧
autocmd('FileType', {
  group = my_group,
  pattern = 'help',
  callback = function()
    vim.cmd('wincmd L')
  end,
})

-- C++ 特定配置（加载 cpp.vim 原本内容，可转为 Lua 或直接 source）
-- 这里演示两种方式：直接 source 原有文件，或内联设置
-- 方法1：source 原有文件（如果不想全部转换）
-- autocmd('FileType', {
--   pattern = 'cpp',
--   callback = function()
--     vim.cmd('source ~/.vim/config/languages/cpp.vim')
--   end
-- })
--
-- 方法2：直接写 Lua（推荐）
autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.opt.cindent = true
    vim.opt.cinoptions = 'g0,:0,N-s,(0'
  end,
})


autocmd("CursorHold", {
    callback = function ()
        local diagnostics = vim.diagnostic.get(nil, { lnums = {vim.fn.line('.')} })
        if #diagnostics > 0 then
            vim.diagnostic.open_float(nil, {
                focusable = false,
                scope = 'line',
                border = 'rounded',
                source = true,
            })
        end
    end
})

--markdown
autocmd(
        {"BufRead", "BufNewFile"},
        {pattern = {"*.md", "*.mdown", "*.mkd", ".markdown", "*.mdwn"},
        callback = function()
            vim.bo.filetype = "markdown"
            vim.opt_local.foldenable = false
        end,
    })

