# Neovim 配置快捷键速查手册

> Leader 键：`,`（逗号）
> 生成日期：2026-07

---

## 目录

- [一、文件与导航](#一文件与导航)
- [二、LSP（代码智能）](#二lsp代码智能)
- [三、代码补全](#三代码补全)
- [四、Git 相关](#四git-相关)
- [五、编辑增强](#五编辑增强)
- [六、诊断与问题列表](#六诊断与问题列表)
- [七、Buffer 与标签页](#七buffer-与标签页)
- [八、配置管理](#八配置管理)
- [九、Treesitter](#九treesitter)
- [十、原生 VimNeovim 通用操作](#十原生-vimneovim-通用操作)

---

## 一、文件与导航

### nvim-tree.lua（文件树）

| 快捷键 | 功能 |
|---|---|
| `<C-n>` | 打开/关闭文件树 |
| `<leader>e` | 聚焦到文件树 |
| `o` / `<CR>` | 打开文件/展开目录 |
| `<Tab>` | 预览文件（不切换焦点） |
| `<C-v>` | 垂直分屏打开 |
| `<C-x>` | 水平分屏打开 |
| `<C-t>` | 新标签页打开 |
| `a` | 新建文件/目录（以 `/` 结尾表示目录） |
| `d` | 删除 |
| `r` | 重命名 |
| `x` | 剪切 |
| `c` | 复制 |
| `p` | 粘贴 |
| `R` | 刷新 |
| `q` | 关闭树 |
| `g?` | 查看树内完整帮助 |
| `-` | 根目录跳到上一级 |
| `P` | 跳到父目录节点 |
| `J` / `K` | 跳到本级最后/第一个节点 |
| `>` / `<` | 跳到下/上一个同级兄弟节点 |
| `y` | 复制文件名 |
| `Y` | 复制相对路径 |
| `gy` | 复制绝对路径 |
| `H` | 显示/隐藏隐藏文件（dotfiles） |
| `I` | 显示/隐藏 gitignore 里的文件 |
| `W` | 全部折叠 |
| `E` | 全部展开 |
| `S` | 树内模糊搜索定位 |
| `f` / `F` | 实时过滤 / 清除过滤 |
| `s` | 用系统程序打开 |
| `<C-]>` | 把光标所在目录设为新根目录 |

### telescope.lua（模糊搜索）

| 快捷键 | 功能 |
|---|---|
| `<leader>ff` | 搜索文件名 |
| `<leader>fg` | 全局内容搜索（grep） |
| `<leader>fb` | 搜索已打开的 buffer |
| `<leader>fh` | 搜索帮助文档 |
| `<leader>fs` | 搜索工作区符号 |
| `<leader>fd` | 搜索诊断信息 |

常用但未映射的命令（可手动执行或自行加映射）：

```vim
:Telescope oldfiles      " 最近打开过的文件
:Telescope git_status    " 查看 git 改动的文件
:Telescope git_commits   " 提交历史
:Telescope git_branches  " 分支列表，可直接切换
:Telescope keymaps       " 搜索所有已注册的快捷键
:Telescope commands      " 搜索所有可用命令
:Telescope resume        " 恢复上一次的搜索结果
```

搜索窗口内通用操作：

| 快捷键 | 功能 |
|---|---|
| `<C-j>` / `<C-k>` | 上下选择 |
| `<CR>` | 打开选中项 |
| `<C-x>` / `<C-v>` / `<C-t>` | 水平/垂直/新标签页打开 |
| `<C-u>` / `<C-d>` | 预览窗口上下滚动 |
| `<Esc>` | 退出搜索 |

### aerial.lua（代码大纲）

| 快捷键 | 功能 |
|---|---|
| `<leader>t` | 打开/关闭大纲侧栏 |
| `{` / `}` | 跳到上/下一个符号（在代码区） |

```vim
:AerialInfo   " 查看当前使用的 backend（LSP/Treesitter）
```

---

## 二、LSP（代码智能）

来自 `lspconfig.lua` 的 `on_attach`：

| 快捷键 | 功能 |
|---|---|
| `gd` | 跳转到定义 |
| `gr` | 查看所有引用 |
| `K` | 悬浮查看文档/类型信息 |
| `<leader>rn` | 重命名变量/函数 |
| `<leader>ca` | 代码操作（自动修复建议） |
| `[d` / `]d` | 跳到上/下一个诊断错误 |

建议补充的原生 LSP 映射：

| 快捷键 | 功能 |
|---|---|
| `gi` | 跳转到实现 |
| `gD` | 跳转到声明（区别于定义） |
| `<C-k>` | 查看函数签名（插入模式常用） |
| `<leader>D` | 跳转到类型定义 |
| `<leader>ds` | 悬浮显示当前行完整诊断信息 |
| `<leader>dl` | 把所有诊断丢进 location list |

### mason.lua（LSP server 管理）

```vim
:Mason          " 打开管理面板，装卸 LSP/格式化工具
:MasonUpdate    " 更新已装工具
```

---

## 三、代码补全

### cmp.lua

插入模式下生效：

| 快捷键 | 功能 |
|---|---|
| `<C-Space>` | 手动唤出补全菜单 |
| `<Tab>` | 选下一个候选项 / 展开代码片段 / 跳到下一个填空位 |
| `<S-Tab>` | 选上一个候选项 / 跳到上一个填空位 |
| `<CR>` | 确认选中的候选项（需先主动选中才生效） |
| `<C-e>` | 取消补全 |
| `<C-b>` / `<C-f>` | 文档窗口向上/下滚动 |

补充说明：
- `path` 补全源：输入 `./` 或 `/` 开头的路径时会自动补全文件名
- `documentation` 窗口跟随候选项自动显示，无需额外操作

---

## 四、Git 相关

### git.lua（vim-fugitive）

```vim
:G                     " 打开状态窗口
:G blame                " 逐行 blame
:G log                  " 提交历史
:G diff                 " 当前文件 diff
:G push / :G pull
:G checkout <branch>    " 切换分支
:Gvdiffsplit             " 垂直对比工作区和 HEAD 差异（解决冲突）
:G mergetool             " 冲突解决工具
```

`:G` 状态窗口内快捷键：

| 快捷键 | 功能 |
|---|---|
| `s` | 暂存(stage)光标所在文件 |
| `u` | 取消暂存 |
| `=` | 展开/收起该文件的 diff 预览 |
| `cc` | 提交 |
| `dd` | 查看该文件 diff（分屏） |

### gitsigns.lua（行内变更标记）

| 快捷键 | 功能 |
|---|---|
| `]h` / `[h` | 跳到下/上一个改动块 |
| `<leader>hs` | 暂存当前改动块 |
| `<leader>hr` | 撤销当前改动块 |
| `<leader>hp` | 预览当前改动块的 diff |
| `<leader>hb` | 查看当前行的完整 blame |
| `<leader>hd` | 对比当前文件与上次提交的差异 |
| `<leader>tb` | 开关行尾常驻 blame 显示 |

---

## 五、编辑增强

### commentary.lua（注释切换）

| 快捷键 | 功能 |
|---|---|
| `gcc` | 注释/取消注释当前行 |
| `gc` + 移动命令 | 注释选中范围，如 `gcap` 注释一个段落 |
| 可视模式 `gc` | 注释选中的多行 |
| `gcgc` | 取消注释（智能识别已注释块） |
| `gco` | 下方新建一行并注释 |
| `gcO` | 上方新建一行并注释 |

### auto-pairs.lua（自动括号补全）

无需按键，插入 `(` `{` `[` `"` 等符号时自动补全配对符号。

### toggleterm.lua（终端）

> ⚠️ 请核对你实际配置中的 `open_mapping`，以下为常见默认值

```vim
<C-\>                                " 打开/关闭浮动终端
:ToggleTerm
:ToggleTerm direction=horizontal
:ToggleTerm direction=vertical
:ToggleTerm direction=float
```

终端内 `<C-\><C-n>` 回到 Normal 模式后可用 `<C-w>` 系列切换窗口。

---

## 六、诊断与问题列表

### trouble.lua

| 快捷键 | 功能 |
|---|---|
| `<leader>xx` | 打开/关闭诊断列表 |
| `<leader>xX` | 打开/关闭当前 buffer 诊断列表 |
| `<leader>cl` | LSP 定义/引用列表 |
| `<leader>cs` | 符号列表 |
| `<leader>xL` | Location List |
| `<leader>xQ` | Quickfix List |

Trouble 窗口内部：

| 快捷键 | 功能 |
|---|---|
| `<CR>` | 跳转到该问题所在位置 |
| `o` | 跳转但保持 Trouble 窗口打开 |
| `<Tab>` | 预览（不跳转） |
| `r` | 刷新列表 |
| `p` | 切换是否显示预览窗口 |
| `zM` / `zR` | 全部折叠/展开分组 |
| `q` | 关闭 Trouble |

---

## 七、Buffer 与标签页

### bufferline.lua

> ⚠️ 以下为建议补充的映射，当前配置中尚未添加

```lua
map('n', '<leader>bp', '<cmd>BufferLinePick<CR>')
map('n', '<leader>bc', '<cmd>BufferLinePickClose<CR>')
map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>')
map('n', '[b', '<cmd>BufferLineCyclePrev<CR>')
map('n', ']b', '<cmd>BufferLineCycleNext<CR>')
```

### 原生 buffer 操作（keymaps.lua）

| 快捷键 | 功能 |
|---|---|
| `<C-l>` / `<C-h>` | 切换到下/上一个 buffer |
| `<leader>d` | 关闭当前 buffer |
| `<leader>1` / `<leader>2` | 跳转到 buffer 1 / 2 |

---

## 八、配置管理

| 快捷键 | 功能 |
|---|---|
| `<leader><esc>` | 清除搜索高亮 |
| `<leader>ve` | 编辑 init.lua |
| `<leader>vb` | 编辑 options.lua |
| `<leader>vk` | 编辑 keymaps.lua |
| `<leader>s` | 重新加载 init.lua |
| `<leader>pi` | Lazy 插件安装 |
| `<leader>pu` | Lazy 插件更新 |
| `<leader>pc` | Lazy 插件清理 |
| `<leader><leader>y`（可视模式） | 复制到系统剪贴板 |
| `<leader><leader>p` | 从系统剪贴板粘贴 |
| `<leader>snu` / `<leader>snn` | 显示/隐藏行号 |
| `<leader>h` | 查看光标所在词的帮助文档 |

### which-key

| 快捷键 | 功能 |
|---|---|
| `<leader>?` | 显示当前缓冲区可用的快捷键提示 |
| 按下 `<leader>` 后停顿 | 自动弹出分组菜单 |

---

## 九、Treesitter

- 语法高亮、智能折叠自动生效，无需按键
- 折叠相关（若启用 treesitter 折叠）：
  - `za` 切换当前折叠
  - `zR` 展开所有折叠
  - `zM` 折叠所有

> 💡 如需"选中整个函数/类"这类语义级文本对象操作（`af`/`if`/`ac`/`ic`），需要额外安装 `nvim-treesitter/nvim-treesitter-textobjects`，当前配置未包含此插件。

---

## 十、原生 Vim/Neovim 通用操作

配合插件使用频率很高，容易被忘记：

| 操作 | 功能 |
|---|---|
| `:%s/old/new/g` | 全文替换 |
| `:%s/old/new/gc` | 全文替换，逐个确认 |
| `gg=G` | 自动重新缩进整个文件 |
| `zz` | 让当前行居中显示 |
| `*` / `#` | 搜索光标下单词的下/上一处出现 |
| `<C-o>` / `<C-i>` | 跳转历史后退/前进（**用 `gd` 跳转后返回的关键键**） |
| `:vs` / `:sp` | 垂直/水平分屏 |
| `<C-w>` + `hjkl` | 窗口间移动 |
| `<C-w>q` | 关闭当前窗口 |
| `dd` / `yy` / `p` | 删除/复制/粘贴当前行 |
| `ciw` / `caw` | 修改光标所在单词（内部/含空格） |
| `.` | 重复上一次操作 |

---

## 使用建议

1. 前两周高频参照本文档，常用键（`gd`、`K`、`<leader>ff`、`gcc`、`<C-n>`）会逐渐变成肌肉记忆
2. 记不住的键，随手按 `<leader>?` 或停顿等 which-key 弹窗提示，不必死记
3. nvim-tree 内按 `g?`、Telescope 用 `:Telescope keymaps` 可以查到实时生效的完整键位表，比本文档更权威（本文档可能因后续配置变动而过时）
