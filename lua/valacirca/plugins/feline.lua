-- Inspiration
-- https://github.com/EdenEast/nightfox.nvim/blob/main/misc/feline.lua
-- https://github.com/freddiehaddad/nvim/blob/main/lua/plugins/feline.lua

-- Gruvbox Material
-- https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim
-- local theme = {
--   bg0 = '#282828',
--   bg1 = '#3c3836',
--   bg2 = '#504945',
--   fg0 = '#d4be98',
--   fg1 = '#ddc7a1',
--   red = '#ea6962',
--   orange = '#e78a4e',
--   yellow = '#d8a657',
--   green = '#a9b665',
--   aqua = '#89b482',
--   blue = '#7daea3',
--   purple = '#d3869b',
-- }

local gruvboxMaterial = {
  black = '#282828',
  bg = '#3c3836',
  white = '#ddc7a1',
  fg = '#d4be98',
  red = '#ea6962',
  orange = '#e78a4e',
  yellow = '#d8a657',
  green = '#a9b665',
  cyan = '#89b482',
  skyblue = '#7daea3',
  oceanblue = '#7daea3',
  violet = '#d3869b',
  magenta = '#d3869b',
}

local vi_mode_colors = {
  ['NORMAL'] = gruvboxMaterial.green,
  ['OP'] = gruvboxMaterial.green,
  ['CONFIRM'] = gruvboxMaterial.orange,
  ['INSERT'] = gruvboxMaterial.red,
  ['VISUAL'] = gruvboxMaterial.orange,
  ['LINES'] = gruvboxMaterial.orange,
  ['BLOCK'] = gruvboxMaterial.orange,
  ['REPLACE'] = gruvboxMaterial.violet,
  ['V-REPLACE'] = gruvboxMaterial.violet,
  ['ENTER'] = gruvboxMaterial.cyan,
  ['MORE'] = gruvboxMaterial.cyan,
  ['SELECT'] = gruvboxMaterial.magenta,
  ['COMMAND'] = gruvboxMaterial.magenta,
  ['SHELL'] = gruvboxMaterial.magenta,
  ['TERM'] = gruvboxMaterial.magenta,
  ['NONE'] = gruvboxMaterial.yellow,
}

local vi_mode = require 'feline.providers.vi_mode'
local file = require 'feline.providers.file'
local separators = require('feline.defaults').statusline.separators.default_value
local lsp = require 'feline.providers.lsp'

local c = {
  -- left
  vim_status = {
    provider = function()
      local s
      if require('lazy.status').has_updates() then
        s = require('lazy.status').updates()
      else
        s = ''
      end
      s = string.format(' %s ', s)
      return s
    end,
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.skyblue },
    right_sep = {
      always_visible = true,
      str = separators.slant_right,
      hl = { fg = gruvboxMaterial.skyblue, bg = gruvboxMaterial.bg },
    },
  },

  vi_mode = {
    provider = function()
      return string.format(' %s ', vi_mode.get_vim_mode())
    end,
    hl = function()
      return { fg = gruvboxMaterial.bg, bg = vi_mode_colors[vi_mode.get_vim_mode()] }
    end,
    right_sep = {
      always_visible = true,
      str = separators.slant_right,
      hl = function()
        return { fg = vi_mode_colors[vi_mode.get_vim_mode()], bg = gruvboxMaterial.bg }
      end,
    },
    left_sep = {
      always_visible = true,
      str = separators.slant_right,
      hl = function()
        return { fg = gruvboxMaterial.bg, bg = vi_mode_colors[vi_mode.get_vim_mode()] }
      end,
    },
  },

  git_branch = {
    provider = function()
      local git = require 'feline.providers.git'
      local branch, icon = git.git_branch()
      local s
      if #branch > 0 then
        s = string.format(' %s%s ', icon, branch)
      else
        s = string.format(' %s ', 'Untracked')
      end
      return s
    end,
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.orange },
    left_sep = {
      always_visible = true,
      str = separators.slant_right,
      hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.orange },
    },
    right_sep = {
      always_visible = true,
      str = separators.slant_right,
      hl = { fg = gruvboxMaterial.orange, bg = gruvboxMaterial.bg },
    },
  },

  git_added = {
    provider = function()
      local git = require 'feline.providers.git'
      local branch, _ = git.git_diff_added()
      local s
      if #branch > 0 then
        s = string.format(' %s%s', ' ', branch)
      else
        s = string.format(' %s ', '')
      end
      return s
    end,
    hl = { fg = gruvboxMaterial.green, bg = gruvboxMaterial.bg },
  },

  git_changed = {
    provider = function()
      local git = require 'feline.providers.git'
      local branch, _ = git.git_diff_changed()
      local s
      if #branch > 0 then
        s = string.format(' %s%s', ' ', branch)
      else
        s = string.format(' %s ', '')
      end
      return s
    end,
    hl = { fg = gruvboxMaterial.yellow, bg = gruvboxMaterial.bg },
  },

  git_removed = {
    provider = function()
      local git = require 'feline.providers.git'
      local branch, _ = git.git_diff_removed()
      local s
      if #branch > 0 then
        s = string.format(' %s%s', ' ', branch)
      else
        s = string.format(' %s ', '')
      end
      return s
    end,
    hl = { fg = gruvboxMaterial.red, bg = gruvboxMaterial.bg },
  },

  -- right
  file_name = {
    provider = {
      name = 'file_info',
      opts = {
        colored_icon = false,
        file_modified_icon = '󰫣',
        file_readonly_icon = ' ',
      },
    },
    hl = { fg = gruvboxMaterial.cyan, bg = gruvboxMaterial.bg },
    right_sep = {
      always_visible = true,
      str = separators.block,
    },
    -- left_sep = {
    --   always_visible = true,
    --   str = separators.slant_left,
    --   hl = { fg = gruvboxMaterial.fg, bg = gruvboxMaterial.yellow },
    -- },
  },

  macro = {
    provider = function()
      local s
      local recording_register = vim.fn.reg_recording()
      if #recording_register == 0 then
        s = ''
      else
        s = string.format(' Recording @%s ', recording_register)
      end
      return s
    end,
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.skyblue },
    left_sep = {
      always_visible = true,
      str = separators.slant_left,
      hl = function()
        return { fg = gruvboxMaterial.skyblue, bg = gruvboxMaterial.bg }
      end,
    },
  },

  search_count = {
    provider = function()
      if vim.v.hlsearch == 0 then
        return ''
      end

      local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 250 })
      if not ok then
        return ''
      end
      if next(result) == nil then
        return ''
      end

      local denominator = math.min(result.total, result.maxcount)
      return string.format(' [%d/%d] ', result.current, denominator)
    end,
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.yellow },
    left_sep = {
      always_visible = true,
      str = separators.slant_left,
      hl = function()
        return { fg = gruvboxMaterial.yellow, bg = gruvboxMaterial.skyblue }
      end,
    },
  },

  lsp = {
    provider = function()
      if not lsp.is_lsp_attached() then
        return ''
      end
      return string.format(' %s ', require('lsp-progress').progress())
    end,
    hl = function()
      if not lsp.is_lsp_attached() then
        return { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.violet }
      end
      return { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.orange }
    end,
    left_sep = {
      always_visible = true,
      str = separators.slant_left,
      hl = function()
        if not lsp.is_lsp_attached() then
          return { bg = gruvboxMaterial.yellow, fg = gruvboxMaterial.violet }
        end
        return { bg = gruvboxMaterial.yellow, fg = gruvboxMaterial.orange }
      end,
    },
    right_sep = {
      always_visible = true,
      str = separators.slant_left,
      hl = function()
        if not lsp.is_lsp_attached() then
          return { bg = gruvboxMaterial.violet, fg = gruvboxMaterial.red }
        end
        return { bg = gruvboxMaterial.orange, fg = gruvboxMaterial.red }
      end,
    },
  },

  cursor_position = {
    provider = {
      name = 'position',
      opts = { padding = false },
    },
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.red },
    left_sep = {
      always_visible = true,
      str = separators.block,
      hl = { fg = gruvboxMaterial.red },
      -- str = string.format('%s%s', separators.slant_left, separators.block),
      -- hl = function()
      --   return { fg = gruvboxMaterial.orange, bg = gruvboxMaterial.yellow }
      -- end,
    },
    right_sep = {
      always_visible = true,
      str = separators.slant_left,
      hl = { fg = gruvboxMaterial.red, bg = gruvboxMaterial.red },
    },
  },

  scroll_bar = {
    provider = {
      name = 'scroll_bar',
      opts = { reverse = true },
    },
    hl = { fg = gruvboxMaterial.skyblue, bg = gruvboxMaterial.bg },
  },

  middle = {
    hl = { bg = gruvboxMaterial.bg },
  },

  -- inactive statusline
  in_file_info = {
    provider = function()
      if vim.api.nvim_buf_get_name(0) ~= '' then
        return file.file_info({}, { colored_icon = false, file_readonly_icon = ' ' })
      else
        return file.file_type({}, { colored_icon = false, case = 'lowercase', file_readonly_icon = ' ' })
      end
    end,
    hl = { fg = gruvboxMaterial.bg, bg = gruvboxMaterial.skyblue },
    left_sep = {
      always_visible = true,
      str = string.format('%s%s', separators.slant_left, separators.block),
      hl = { fg = gruvboxMaterial.skyblue, bg = gruvboxMaterial.bg },
    },
    right_sep = {
      always_visible = true,
      str = string.format('%s%s', separators.block, separators.block),
      hl = { fg = gruvboxMaterial.skyblue, bg = gruvboxMaterial.skyblue },
    },
  },
}

local active = {
  { -- left
    c.vim_status,
    c.vi_mode,
    c.git_branch,
    c.git_added,
    c.git_changed,
    c.git_removed,
    c.middle,
  },
  { -- right
    c.file_name,
    c.macro,
    c.search_count,
    c.lsp,
    c.cursor_position,
    c.scroll_bar,
  },
}

local inactive = {
  { -- left
    c.middle,
  },
  { -- right
    c.in_file_info,
  },
}

require('feline').setup {
  theme = gruvboxMaterial,
  components = { active = active, inactive = inactive },
}
