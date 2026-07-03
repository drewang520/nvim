local colors = require("plugins.lualine.colors")
local components = require("plugins.lualine.components")

local M = {}

-- Triangle separators for parallelogram shapes
local sep_fwd = { -- \xxx\ forward leaning (left side: a, b)
  left = vim.fn.nr2char(0xE0BE),
  right = vim.fn.nr2char(0xE0B8),
}
local sep_bwd = { -- /xxxx/ backward leaning (right side: z)
  left = vim.fn.nr2char(0xE0BA),
  right = vim.fn.nr2char(0xE0BC),
}

-- Mode name mapping
local mode_map = {
  n = "NORMAL",
  no = "OP-PEND",
  nov = "OP-VIS",
  noV = "OP-LIN",
  ni = "NORMAL",
  nt = "TERM",
  ntT = "TERM",
  v = "VISUAL",
  vs = "VISUAL",
  V = "V-LINE",
  Vs = "V-LINE",
  s = "SELECT",
  S = "S-LINE",
  i = "INSERT",
  ic = "INSERT",
  ix = "INSERT",
  t = "TERM",
  R = "REPLACE",
  Rc = "REPLACE",
  Rx = "REPLACE",
  Rv = "V-REPLACE",
  r = "PENDING",
  rm = "MORE",
  rQ = "CONFIRM",
  ["!"] = "SHELL",
}

-- Mode icons
local mode_icon = {
  n = "󰣭",
  i = "󰏫",
  v = "󰈔",
  V = "󰈊",
  t = "󱊦",
  R = "󱎕",
}

-- Active sections
M.sections = {
  --  ╱ NORMAL ╱  (forward leaning parallelogram)
  lualine_a = {
    {
      "mode",
      separator = sep_fwd,
      fmt = function(mode_name)
        local raw = vim.fn.mode()
        local display_mode = mode_map[raw] or mode_name
        return (mode_icon[raw] or "") .. " " .. display_mode
      end,
    },
  },

  --  ╱ branch ╱  ╱ +1 -2 ╱  (forward leaning parallelograms)
  lualine_b = {
    -- components.spacer,
    {
      "branch",
      icon = { vim.fn.nr2char(0xf126) .. "", color = { fg = colors.violet } },
      colored = true,
      color = { bg = colors.git_bg},
      separator = sep_fwd,
      fmt = function (name)
          return name ~= "" and name or "null"
      end,
    },
    {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = "󱪟 ",
      },
      diff_color = {
        added = { fg = colors.green, gui = "bold" },
        modified = { fg = colors.yellow, gui = "bold" },
        removed = { fg = colors.red, gui = "bold" },
      },
      color = { bg = colors.diff_bg},
      separator = sep_fwd,
      fmt = function (str)
          return str ~= "" and str or " 0"
      end,
    },
    -- components.spacer,
    {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      color = { bg = colors.grey},
      separator = sep_fwd,
      symbols = {
        error = "󰅙 ",
        warn = "󰀦 ",
        info = "󰋼 ",
        hint = "󰌶",
      },
      diagnostics_color = {
        error = { fg = colors.red, gui = "bold" },
        warn = { fg = colors.orange },
        info = { fg = colors.cyan },
        hint = { fg = colors.violet },
      },
      fmt = function (str)
          return str ~= "" and str or "✓"
      end,
    },
  },

  -- filename  diagnostics (transparent, no parallelogram)
  lualine_c = {
    {
      "filename",
      path = 1,
      separator = sep_fwd,
      symbols = {
        modified = "󰷮",
        readonly = "󰌾 ",
        unnamed = "󰈙 ",
        exclusive = "󰈔 ",
      },
      color = function()
        if vim.bo.modified then
          return { fg = colors.yellow, bg = colors.grey, gui = "bold" }
        elseif vim.bo.readonly then
          return { fg = colors.red, bg = colors.grey, gui = "bold" }
        end
        return {fg = colors.white, bg = colors.grey, gui = 'bold'}
      end,
    },
  },

  -- AI / tool status (transparent, no parallelogram)
  lualine_x = {
    components.flutter_device,
    components.ai_model,
    components.avante,
    {
        function() return require('nvim-navic').get_location()
        end,
        cond = function() return package.loaded['nvim-navic'] and require('nvim-navic').is_available
        end,
    },
    {
        'encoding',
        color = {fg = colors.white, bg = colors.grey, gui = 'bold'},
        separator = sep_bwd,
    },
    {
        'fileformat',
        symbols = {
          unix = ' unix',
          dos = ' dos',
          mac = ' mac',
        },
        color = {fg = colors.white, bg = colors.grey, gui = 'bold'},
        separator = sep_bwd,
    },
    {
        'filetype',
        separator = sep_bwd,
    },
  },

  lualine_y = {
      {
          function ()
              return string.format("%d%%%%", math.floor((vim.fn.line('.') / vim.fn.line('$')) * 100))
          end,
          color = {fg = colors.white, bg = colors.grey, gui = 'bold'},
          separator = sep_bwd,
      },
      {
          "location",
          color = {fg = colors.white, bg = colors.grey, gui = 'bold'},
          separator = sep_bwd,
      },
  },

  --  ╲  lsp ╲  (backward leaning parallelogram)
  lualine_z = {
    -- {
    --   "filetype",
    --   left_padding = 1,
    --   color = { bg = colors.odark},
    --   separator = sep_bwd,
    --   icon_only = true,
    -- },
    -- components.spacer,
    components.lsp,
  },
}

-- Inactive sections
M.inactive_sections = {
  lualine_a = {},
  lualine_b = { { "filename", path = 1 } },
  lualine_c = {},
  lualine_x = { "filetype" },
  lualine_y = {},
  lualine_z = {},
}

return M
