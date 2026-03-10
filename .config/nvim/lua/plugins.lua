local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	--autocompletition
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},},--indent guides
	{"windwp/nvim-autopairs", event = "InsertEnter", config = true},--autoclose brackets

	{'akinsho/toggleterm.nvim', version = '*', config = true}, --better terminal
	'nvim-tree/nvim-web-devicons',
	'goolord/alpha-nvim',--main menu
	'github/copilot.vim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',--finder
	'akinsho/bufferline.nvim',--tabs
	tag = "v3.*",
	'ellisonleao/gruvbox.nvim',--theme
	'nvim-lualine/lualine.nvim'--statusline
  })

--setting theme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
