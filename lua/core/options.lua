local opt = vim.opt

-- 基础 UI
opt.number = true
opt.cursorline = true
opt.cursorcolumn = false
opt.showmatch = true
opt.ruler = true
opt.laststatus = 2
opt.signcolumn = 'yes'

-- 缩进
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.wrap = false
opt.backspace = { 'indent', 'eol', 'start' }

-- 折叠
opt.foldenable = false
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldcolumn = '1'

-- 搜索
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- 文件
opt.autowrite = true
opt.autoread = true
opt.backup = false
opt.confirm = true
opt.swapfile = false

-- 编码
opt.helplang = 'cn'
opt.encoding = 'utf-8'
opt.fileencodings = { 'utf8', 'ucs-bom', 'gbk', 'cp936', 'gb2312', 'gb18030' }

-- 其他
opt.virtualedit = 'block,onemore'
opt.syntax = 'on'
opt.errorbells = false
opt.visualbell = false

-- 与 Vim 兼容
opt.termguicolors = true
opt.updatetime = 250
opt.scrolloff = 8
opt.fillchars = { vert = '│', horiz = '─', eob = ' ' }

-- 文件类型检测
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')


