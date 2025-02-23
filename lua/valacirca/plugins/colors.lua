return {
  -- Color highlighter
  {
    'brenoprata10/nvim-highlight-colors',
    opts = {
      render = 'virtual',
      virtual_symbol = '⬢',
      virtual_symbol_position = 'inline',
    },
  },

  -- Install colorschemes
  {
    'folke/tokyonight.nvim',
    'comfysage/evergarden',
    'Th3Whit3Wolf/onebuddy',
    'catppuccin/nvim',
    'rose-pine/neovim',
    'kdheepak/monochrome.nvim',
    'sainnhe/everforest',
    'AlexvZyl/nordic.nvim',
    'savq/melange-nvim',
    'rebelot/kanagawa.nvim',
    {
      'sho-87/kanagawa-paper.nvim',
      lazy = false,
      priority = 1000,
      opts = {},
    },
  },

  -- Set default to the epic GRUVBOX
  {
    'sainnhe/gruvbox-material',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'gruvbox-material'
      vim.g.gruvbox_material_background = 'hard'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
