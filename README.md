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

## 十一、跳转增强 flash.nvim

##### 1、`s` ：基础跳转

```
按 s
在 Normal/
→ 输入 1-2 个字符（比如你想跳到某处的 "if"）
→ 屏幕上所有匹配 "if" 的位置会标记一个跳转字母（比如 a、b、c……）
→ 按对应字母，光标瞬间跳过去

在Visual：
先 v 进入可视模式，再按 s 跳转，会从当前位置选中到跳转目标，等于快速选中一大段文字。

在Operator-pending:
比如按 d 之后再按 s，就变成"删除到跳转目标"，比如 ds 然后跳到某处，能一次性删除中间所有内容——这是最强大的组合，等于给任何编辑操作（d/c/y）配上了瞬移能力。
```

##### 2、`S`：Treesitter语义跳转

```
按 S
→ 屏幕上会标出当前作用域内所有 Treesitter 语法节点（函数、类、if块等）
→ 按标记字母跳转，或者配合可视模式一次性选中整个语法块

适合"我想选中整个函数体"这种场景，比手动 %  或者数缩进精确得多。
```

##### 3、`r`：Operator-pending模式，远程操作

```
比如按 yr 然后输入搜索字符跳转，会在光标不移动的情况下，
对远处那个位置执行 y（复制）操作，完成后光标还在原地

适合"我想复制别处一段文字，但不想来回跳"的场景
```

##### 4、`R`：Treesitter 搜索跳转（配合 Visual/Operator 模式）

```
跟 S 类似，但结合了搜索模式，用于更精确地在语法树上定位。
```

##### 5、`<C-s>`：命令行模式 --搜索时开关flash

```
当你按 / 或 ? 进入原生搜索模式时，按 <C-s> 可以临时启用/关闭 Flash 的增强效果（标记跳转字母），如果你想要"原生搜索 + Flash 加速跳转"的组合体验。
```

#### vim原生行内跳转增强： t/T f/F

`f{字符}`  : 光标跳到当前行**下一个**该字符**上面**

`F{字符}` :  光标跳到当前行**上一个**该字符**上面**

`t{字符}`  : 光标跳到当前行下一个该字符**前一位**

`T{字符}`  :光标跳到当前行上一个该字符**后一位**

`;`：重复上一次 f/F/t/T 操作

`,`：反方向重复上一次 f/F/t/T 操作



## 十二、包裹符号 nvim-surround

`add`:  ys {motion} {char}

```
ysiw" : 给单词加引号
ysiw) : 给单词加括号
ys$"  : 给当前单次到末尾加引号
```

`delete`: ds {char}

```
ds(  : 删除包裹的括号
```

`change`：cs {target}

```
cd"' : 把单引号改为双引号
```

## Other、Neovim 底层原理

```
1. 终端敲 nvim / vim
   ↓
2. Neovim 二进制程序启动，初始化 Lua 运行环境（内置 LuaJIT）
   ↓
3. 查找并执行用户配置入口文件
   （查找顺序：~/.config/nvim/init.lua，如果没有则找 init.vim）
   ↓
4. 你的 init.lua 从头到尾按顺序执行：
   4.1 vim.g.mapleader = ','          ← 设置全局变量
   4.2 require('core.options')        ← 加载并立即执行这个文件
   4.3 require('core.keymaps')        ← 同上
   4.4 require('core.autocmds')       ← 同上
   
   4.5 设置 lazypath，检查 lazy.nvim 是否已下载，没有就 git clone
   4.6 vim.opt.rtp:prepend(lazypath)  ← 把 lazy.nvim 加入 Lua 的模块搜索路径
   4.7 require('lazy').setup({...})   ← 这一步是重头戏，见下方详解
   4.8 require('core.highlights')     ← 主题和高亮设置
   ↓
5. Neovim 主界面渲染出来，等待你输入
```

### 1、初始配置文件：～.config/nvim/init.lua

```lua
-- setting mapleader
-- 定义全局和局部前缀键， 将两者都设为逗号 ,，意味着后续所有以 <Leader> 开头的键盘映射都将使用 , 作为前缀（例如 <Leader>w 变成 ,w）。方便用户自定义快捷键，避免与系统或插件默认按键冲突。
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- load core
-- require属于lua关键字，用于加载lua模块
-- 路径为 lua/core/...
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.neovide")


-- load plugins  安装与配置Lazy.nvim插件管理器
-- vim.fn.stdpath("data") 获取 Neovim 的标准数据目录（在 Linux 下通常是 ~/.local/share/nvim）。 拼接出Lazy插件的完整路径lazyPath
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- vim.loop.fs_stat(lazypath) 检查该路径是否存在（即 Lazy 是否已被克隆）
-- 若不存在，则通过 vim.fn.system 执行 git clone 将 Lazy 仓库克隆到该路径（指定 stable 分支，并过滤大文件以加速）。
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
-- 将该路径添加到 Neovim 的 runtimepath 最前面，确保 Lazy 可以被 require 正确加载。
vim.opt.rtp:prepend(lazypath)

-- 启动Lazy并导入插件列表
require("lazy").setup({  -- Lazy 的初始化函数，传入一个插件规范表格。
    -- 表示从 lua/plugins/ 目录下加载插件定义（默认 Lazy 会查找 lua/plugins/ 下的所有 .lua 文件）。
	{ import = "plugins" }, 
})

require("core.highlights")
```

### 2、Lazy.nvim 插件管理器

#### （1）、require('lazy').setup({...})

```
1. lazy.nvim 扫描 {import = 'plugins'} 指定的目录
   （也就是 lua/plugins/ 下所有 .lua 文件）
   ↓
2. 把每个文件 require 进来，拿到它们 return 的那个 table
   （这一步只是"读取配置清单"，还没有真正去下载/加载任何插件代码）
   ↓
3. lazy.nvim 检查每个插件 spec 里有没有 event/cmd/keys/ft 这类字段：
   - 如果没有任何触发条件（没写 event/cmd/keys/ft）
     → 归类为 "start"，会在启动过程中立即加载
   - 如果写了 event = "VeryLazy"
     → 注册一个监听器，等 Neovim 触发 VeryLazy 这个事件时才真正加载
   - 如果写了 cmd = "Telescope"
     → 先创建一个"假的" :Telescope 命令占位，你真正执行它时才加载插件、
       然后把命令转交给插件真正的实现
   - keys/ft 同理，都是"先占位，触发时才真正加载"
   ↓
4. 对于需要立即加载（start）的插件：
   - 把插件的代码目录加入 runtime path（Lua/Vimscript 能找到它的路径）
   - 如果插件有 plugin/xxx.lua 或 plugin/xxx.vim（插件自带的初始化脚本），自动执行
   - 如果你的 spec 里写了 config 函数，执行它
   - 如果你的 spec 里写了 opts（没写 config），
     lazy.nvim 自动帮你执行 require("插件名").setup(opts)
   ↓
5. Neovim 继续往下走，处理 rtp plugins、after 目录等收尾工作
```

#### （2）、Lazy.nvim常用配置域

##### 1、加载规范 spec loading：决定要不要加载、，什么时候加载、按什么顺序加载

关键字：

`**dependencies**`：依赖声明。告诉Lzay必须先加载其中的插件，再加载当前插件 

`**enabled**`：控制这个插件要不要被启用， 可以是布尔值，也可以是个返回布尔值的函数（比如"只在 Linux 上启用"这种条件判断）

```lua
{
  "some/plugin",
  enabled = vim.fn.has("mac") == 1,   -- 只在 macOS 上加载这个插件
}
```

`**cond**`：跟 `enabled` 功能几乎一样, 语义上倾向于"运行时条件判断"

`**priority**`:   配合 `lazy=false`，指定加载优先级（数字越大越早`priority = 1000`）

##### 2、初始化规范： 决定"加载完之后具体执行什么初始化逻辑"

`init`：这是一个函数，**在插件真正被加载（require）之前**执行, 常见用途是设置一些全局变量（`vim.g.xxx`），因为有些插件是通过读取 `vim.g` 里的变量来决定行为的，必须在插件代码跑起来之前就设置好。

```lua
{
  "author/plugin",
  init = function()
    vim.g.some_plugin_option = 1   -- 插件加载前就得设好这个全局变量，插件内部初始化时会读它
  end,
}
```

`opts`：**自动初始化**，简单场景，插件的 setup 函数直接用这个表就行

```lua
return {
  "author/plugin",
  opts = {
    some_option = true,
  },
}
-- 等价于 lazy.nvim 自动执行：
-- require("plugin").setup({ some_option = true })
```

`config`：**手动初始化**，复杂场景，需要写额外逻辑，不只是传参数

```lua
return {
  "author/plugin",
  config = function()
    require("plugin").setup({...})
    -- 还可以在这里额外设置快捷键、高亮组等等
    vim.keymap.set(...)
  end,
}
```

`main`：告诉 lazy.nvim，这个插件真正要 `require` 的模块名是什么，用于区分插件版本分支

```lua
{
  'nvim-treesitter/nvim-treesitter',
  main = "nvim-treesitter.configs",   -- 如果用旧分支需要这样指定
}
```

`build`：插件**装好/更新后**要执行的构建命令

```lua
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate",   -- 装完/更新后自动跑这个 Neovim 命令
}

-- 也可以是外部命令
build = "make", -- 有些插件（比如某些用C写了部分逻辑的）需要编译
```

##### 3、懒加载规范 spec Lazy loading : 决定是否延迟加载该插件

关键字：

`lazy`： 如果为`false`，即强制立即加载（不懒加载）

`event`：

```lua
event = "VeryLazy"                         -- Neovim启动完成后不久触发（UI相关插件常用）
event = { "BufReadPre", "BufNewFile" }      -- 打开文件时触发（文件内容相关插件常用）
event = "InsertEnter"                        -- 进入插入模式时触发（补全类插件常用）
```

`cmd`：

```lua
cmd = "Telescope"                            -- 用户执行某个 :命令 时触发
cmd = { "G", "Git" }                          -- 可以是多个命令
```

`ft`：

```lua
ft = { "python", "lua" }                     -- 打开特定文件类型时触发
```

`keys`：

```lua
keys = { "<leader>ff", "<C-n>" }             -- 用户按某个快捷键时触发
keys = {                                      -- 也可以写详细的（带 desc）
  { "<leader>ff", desc = "查找文件" },
}
```

##### 4、版本规范 spec versioning: 决定"具体用插件的哪个版本/哪份代码"

`branch`：指定拉取这个插件仓库的哪个分支，默认是仓库的默认分支（通常是 `main`/`master`）

```lua
{
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',   -- 明确指定用新架构的 main 分支，而不是维护中的旧 master 分支
}
```

`tag`：锁定到某个具体的发布标签（版本号），不随分支更新而变

```lua
{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',   -- 固定用这个版本，即使插件后续发新版也不会自动跟着变
}
```

`commit`：比 `tag` 更精确，直接锁死到某一次具体的 git 提交哈希，通常用于"这个版本刚好能用，我不想有任何变化"的极端稳定性需求。

```lua
{
  "author/plugin",
  commit = "a1b2c3d4",
}
```

`version`：

按语义化版本号（SemVer）区间锁定，比如只用大版本号是 1 的所有更新：

```lua
{
  "author/plugin",
  version = "^1.0.0",   -- 允许 1.x.x 的任何更新，但不允许跳到 2.0.0
}
```

**`tag`/`commit`/`version` 三者只需要选一个用**，都是"锁版本"的不同精细程度，一般插件如果发布了规范的 release 版本号，用 `version` 最方便；如果插件压根没发布过版本号（很多小插件是这样），只能用 `tag`（如果有）或 `commit`。

`pin`：布尔值，锁定这个插件不参与 `:Lazy update` 的批量更新，需要单独手动更新。适合"这个插件我不想被自动更新影响，怕出兼容性问题"的场景：

```lua
{
  "author/plugin",
  pin = true,
}
```

`submodules`：布尔值，控制 git clone 时要不要顺带拉取这个仓库依赖的 git 子模块（有些插件的仓库结构里内嵌了别的 git 仓库作为子模块）。大多数插件不需要，默认是 `true`，遇到特殊情况才需要手动关掉。

##### 5、高级规范 spec advanced:

`import`：告诉 lazy.nvim 去扫描指定的 Lua 模块路径（对应 `lua/plugins/` 目录）下所有文件，把每个文件当作一个独立的插件 spec 来加载

```lua
require('lazy').setup({
    {import = 'plugins'},   -- 这就是 import
})
```

`optional`：标记这个 spec 是"可选补充配置"，不是一个独立插件声明。常见用法是：你已经在别处声明过某个插件，现在只是想**给它追加一点额外配置**（比如给某个插件加一个新的 dependency），而不是重新声明一遍整个插件。

```lua
{
  "nvim-telescope/telescope.nvim",
  optional = true,
  dependencies = { "some-extra-telescope-extension" },  -- 只是想给已有的 telescope 补充一个依赖
}
```

`spec`：在一个 spec 内部再声明一批别的 spec，相当于"打包捆绑"，一次性引入多个相关插件。较少见，通常是插件集合类的场景才用得到。

`module`：布尔值，控制 lazy.nvim 要不要自动帮你处理"通过 `require` 触发懒加载"这个机制。默认是 `true`（大多数插件靠 `require` 时才真正加载）。极少数情况你会手动设成 `false`，告诉 lazy.nvim"不要用这套自动机制，我自己控制加载时机"。

