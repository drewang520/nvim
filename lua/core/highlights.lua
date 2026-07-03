-- 主题设置
vim.cmd('colorscheme onedark')
vim.opt.background = 'dark'

-- 主题额外选项（原 ui.vim 中的设置）
vim.g.onedark_enable_italic = 1

-- 高亮调整（用 vim.api.nvim_set_hl）
local set_hl = vim.api.nvim_set_hl
set_hl(0, 'LineNr', { fg = '#BCBEC4', ctermfg = 246 })
set_hl(0, 'Comment', { fg = '#5C6370', ctermfg = 243, italic = true })
set_hl(0, 'CocInlayHint', { fg = '#5C6370', ctermfg = 245, italic = true })
set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })

-- ✅ 正确的组名：cmp/LSP hover 等所有浮动窗口通用的高亮组
set_hl(0, 'NormalFloat', { bg = '#282C34' })
set_hl(0, 'FloatBorder', { fg = '#61AFEF', bg = 'NONE' })
set_hl(0, 'Pmenu', { fg = 'white', bg = '#282C34' })
set_hl(0, 'PmenuSel', { fg = '#61AFEF', bg = '#3e4451', bold = true })
set_hl(0, "LspInlayHint", { fg = "#888888", bg = "none", italic = false })

-- 各类型图标配色（可选，进一步区分类型）
set_hl(0, 'CmpItemKindFunction', { fg = '#61AFEF' })
set_hl(0, 'CmpItemKindMethod', { fg = '#61AFEF' })
set_hl(0, 'CmpItemKindVariable', { fg = '#E5C07B' })
set_hl(0, 'CmpItemKindClass', { fg = '#E5C07B' })
set_hl(0, 'CmpItemKindKeyword', { fg = '#C678DD' })
set_hl(0, 'CmpItemKindSnippet', { fg = '#98C379' })
set_hl(0, 'CmpItemKindText', { fg = '#ABB2BF' })
set_hl(0, 'CmpItemMenu', { fg = '#5C6370', italic = true })

-- 匹配到的字符高亮（输入的部分会加粗/变色）
set_hl(0, 'CmpItemAbbrMatch', { fg = '#61AFEF', bold = true })
set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = '#61AFEF', bold = true })

-- nvim_tree
-- nvim-tree 专属配色
set_hl(0, 'NvimTreeFolderIcon', { fg = '#61AFEF' })
set_hl(0, 'NvimTreeFolderName', { fg = '#ABB2BF' })
set_hl(0, 'NvimTreeOpenedFolderName', { fg = '#E5C07B', bold = true })
set_hl(0, 'NvimTreeIndentMarker', { fg = '#3e4451' })   -- 缩进线颜色，柔和不抢眼
set_hl(0, 'NvimTreeRootFolder', { fg = '#C678DD', bold = true })
set_hl(0, 'NvimTreeGitDirty', { fg = '#E5C07B' })
set_hl(0, 'NvimTreeGitNew', { fg = '#98C379' })
set_hl(0, 'NvimTreeGitDeleted', { fg = '#E06C75' })
set_hl(0, 'NvimTreeSpecialFile', { fg = '#61AFEF', underline = true })
set_hl(0, 'NvimTreeExecFile', { fg = '#98C379', bold = true })

local fillchars = vim.opt.fillchars:get()
fillchars.vert = "│"
fillchars.horiz = "─"
fillchars.vertleft = "┤"
fillchars.vertright = "├"
fillchars.verthoriz = "┼"
fillchars.horizup = "┴"
fillchars.horizdown = "┬"
vim.opt.fillchars = fillchars

