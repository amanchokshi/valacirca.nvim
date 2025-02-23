-- NOTE: For more options, you can see `:help option-list`

-- [[ Leader ]] {{{
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- }}}

-- [ Essentials ]] {{{
vim.g.have_nerd_font = true -- Enable some sweet icons
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.errorbells = false -- No error bells of any kind
vim.opt.shortmess = vim.o.shortmess .. "c" -- Ignore all "Enter to continue at bottom of screen"
vim.opt.spelllang = "en_us" -- English language for spell check
vim.opt.encoding = "utf-8" -- Encoding type
vim.opt.autoread = true -- Automatically re-read changed files
vim.opt.syntax = "on" -- Enable syntax highlighting
vim.opt.hidden = true -- Don't unload a buffer when abandoning it
vim.opt.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience
vim.opt.breakindent = true -- Enable break indent
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "a" -- Enable mouse mode
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.
end)
-- }}}

-- [[ Search ]] {{{
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case insensitive search
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.iskeyword:append("-") -- Hypenated words treated as word text objects
vim.opt.incsearch = true -- Highlight matches as you type
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive when uc present
vim.opt.showmatch = true -- Highlight matching brackets
-- }}}

-- [[ Aesthetics ]] {{{
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true -- Support 256 colors
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.pumheight = 10 -- Makes popup menu smaller
vim.opt.showmode = false -- Don't show the current mode
vim.opt.wrap = false -- No wrap long lines
vim.opt.laststatus = 2 -- Always display a status line
vim.opt.cmdheight = 1 -- Command line height
vim.opt.wildmenu = true -- Visual autocomplete for command menu
vim.opt.ttyfast = true -- Faster rendering
vim.opt.scrolloff = 7 -- Scroll automatically when 3 lines from bottom
vim.opt.sidescrolloff = 3 -- Scroll automatically when 3 lines from right edge of screen
vim.opt.signcolumn = "yes" -- Extra column on left of numbers
vim.opt.fillchars = { eob = " " } -- Hide those ugly ~
vim.g.have_nerd_font = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- }}}

-- [[ History ]] {{{
-- Save undo history
vim.opt.undofile = true
vim.o.history = 1000 -- Store a ton of history (default is 20)
vim.o.backupdir = os.getenv("HOME") .. "/.nvim_backup"
vim.o.directory = os.getenv("HOME") .. "/.nvim_backup"
vim.o.undodir = os.getenv("HOME") .. "/.nvim_backup/undo"
-- }}}

-- [[ Ignores ]] {{{
vim.o.wildignore = vim.o.wildignore
	.. "*.o,*.obj,*.pyc,*.aux,*.blg,*.fls,*.blg,*.fdb_latexmk,*.latexmain,.DS_Store,Session.vim,Project.vim,tags,.tags,.sconsign.dblite,.ccls-cache"
vim.o.wildignore = vim.o.wildignore
	.. "vim.lua,blue.vim,darkblue.vim,delek.vim,desert.vim,elflord.vim,evening.vim,industry.vim,koehler.vim,lunaperche.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,quiet.vim,retrobox.vim,ron.vim,shine.vim,slate.vim,sorbet.vim,torte.vim,wildcharm.vim,zaibatsu.vim,zellner.vim"
vim.o.suffixes = ".bak,.o,.info,.swp,.obj"
-- }}}

-- [[ Python ]] {{{
vim.g.python3_host_prog = "/Users/achokshi/.config/nvim/.venv/bin/python"
-- }}}

-- Enable folding
-- vim: set foldmethod=marker:
