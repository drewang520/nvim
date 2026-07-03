return {
  'SmiteshP/nvim-navic',
  dependencies = { 'neovim/nvim-lspconfig' },  -- 确保 lspconfig 已加载
  config = function()
    -- 可选：配置 navic（如图标、深度等）
    require('nvim-navic').setup({
      highlight = true,        -- 高亮当前上下文
      depth_limit = 5,         -- 显示的最大深度
      icons = {
        File          = ' ',
        Module        = ' ',
        Namespace     = ' ',
        Package       = ' ',
        Class         = ' ',
        Method        = ' ',
        Property      = ' ',
        Field         = ' ',
        Constructor   = ' ',
        Enum          = ' ',
        Interface     = ' ',
        Function      = ' ',
        Variable      = ' ',
        Constant      = ' ',
        String        = ' ',
        Number        = ' ',
        Boolean       = ' ',
        Array         = ' ',
        Object        = ' ',
        Key           = ' ',
        Null          = ' ',
        EnumMember    = ' ',
        Struct        = ' ',
        Event         = ' ',
        Operator      = ' ',
        TypeParameter = ' ',
      },
    })
  end,
}
