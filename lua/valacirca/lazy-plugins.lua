-- NOTE: Configure and install plugins

require('lazy').setup({

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Color magic
  require 'valacirca.plugins.colors',

  -- Git stuff
  require 'valacirca.plugins.git',

  -- Which key
  require 'valacirca.plugins.which-key',

  -- Fuzzy finders (files, lsp, etc)
  require 'valacirca.plugins.fuzzy-finders',

  -- LSP Plugins
  require 'valacirca.plugins.lspconfig',

  -- Autoformat
  require 'valacirca.plugins.autoformat',

  -- Autocompletion
  require 'valacirca.plugins.autocompletions',

  -- Linting
  require 'valacirca.plugins.lint',

  -- Highlight todo, notes, etc in comments
  require 'valacirca.plugins.todo',

  -- Mini plugins
  require 'valacirca.plugins.mini',

  -- Highlight, edit, and navigate code
  require 'valacirca.plugins.treesitter',

  -- Peek, markdown preview
  require 'valacirca.plugins.peek',

  -- Smart Column
  require 'valacirca.plugins.smartcolumn',

  -- File browsing
  require 'valacirca.plugins.oil',
  require 'valacirca.plugins.gx',

  -- Noice
  require 'valacirca.plugins.noice',

  -- Zen
  require 'valacirca.plugins.zen',

  -- Feline
  { 'amanchokshi/feline.nvim' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Configure Feline
require 'valacirca.plugins.feline'
