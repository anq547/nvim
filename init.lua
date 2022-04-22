local opt = vim.opt
local g = vim.g

vim.cmd [[
    set nowrap
    set nobackup
    set nowritebackup
    set noerrorbells
    set noswapfile
    function! Preserve(command)
      let w = winsaveview()
      execute a:command
      call winrestview(w)
    endfunction
    autocmd FileType nix map <nowait> <leader>u :call Preserve("%!update-nix-fetchgit --location=" . line(".") . ":" . col("."))<CR>
    autocmd BufWinEnter NvimTree setlocal nonumber
    map ; :
    highlight IndentBlanklineChar guifg = #393b4d
]]

local map = vim.api.nvim_set_keymap

-- plugins
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'folke/tokyonight.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
vim.call('plug#end')


-- Lazy load everything!
dofile("/home/moon/.config/nvim/nvim-tree.lua")
dofile("/home/moon/.config/nvim/lualine.lua")
 
-- Keybinds
local map = vim.api.nvim_set_keymap
options = { noremap = true }
map('n', '<C-p>', ':NvimTreeToggle <CR>', options)
map('n', '<C-f>', ':Telescope find_files <CR>', options)
map('n', '<C-n>', ':Telescope live_grep <CR>', options)
map('n', '<C-l>', ':noh <CR>', options)
map('n', '<C-s>', ':!xclip -sel c -o | pygmentize -f html | xclip -sel c <CR> <CR>', options)
vim.api.nvim_set_keymap('n', '0', "getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^'", {silent = true, noremap = true, expr = true})
g.mapleader = ' '

-- Indent line
g.indent_blankline_char = '▏'
 
-- Performance
opt.lazyredraw = true;
opt.shell = "bash"
opt.shadafile = "NONE"
 
-- Colors
vim.g.tokyonight_style = "day"
opt.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

-- Undo files
opt.undofile = true
 
-- Indentation
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.scrolloff = 3
 
-- Set clipboard to use system clipboard
opt.clipboard = "unnamedplus"
 
-- Use mouse
opt.mouse = "a"
 
-- Nicer UI settings
opt.cursorline = true
opt.relativenumber = true
opt.number = true
 
-- Get rid of annoying viminfo file
opt.viminfo = ""
opt.viminfofile = "NONE"
 
-- Miscellaneous quality of life
opt.ignorecase = true
opt.ttimeoutlen = 5
opt.compatible = false
opt.hidden = true
opt.shortmess = "atI"
