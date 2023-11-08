vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

return function(use)
  use({'SirVer/ultisnips'})
  use({'honza/vim-snippets'})
  
  use({'williamboman/mason.nvim'})
  use({'williamboman/mason-lspconfig.nvim'})
  use({'neovim/nvim-lspconfig'})
  require'lspconfig'.gopls.setup{ 'gopls' }

  use({'simrat39/rust-tools.nvim'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use({'hrsh7th/cmp-nvim-lua'})
  use({'hrsh7th/cmp-nvim-lsp-signature-help'})
  use({'hrsh7th/cmp-vsnip'})
  use({'hrsh7th/cmp-path'})
  use({'hrsh7th/cmp-buffer'})
  use({'hrsh7th/vim-vsnip'})

  use({'atelierbram/vim-colors_atelier-schemes'})
  -- use({'liuchengxu/space-vim-dark'})

  use({'robertmeta/nofrils'})
  use({'vim-test/vim-test'})
  use({'hashivim/vim-terraform'})
  use({'rmagatti/auto-session'})
  use({'ludovicchabant/vim-gutentags'})
  use({'preservim/nerdtree'})
  use({'junegunn/fzf', dir='~/.fzf'})
  use({'junegunn/fzf.vim'})
  use({'mhinz/vim-startify'})
  use({'jeetsukumaran/vim-buffergator'})
  use({'ap/vim-buftabline'})
  use({'airblade/vim-gitgutter'})
  use({'majutsushi/tagbar'})
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use({'arkav/lualine-lsp-progress'})
  require('lualine').setup({
    options = { theme = 'palenight' },
    sections = {
      lualine_b ={ {'filename', path=1} },
	  	lualine_c = {
			  'lsp_progress'
		  }
	  },
    inactive_sections = {
      lualine_a = {},
      lualine_b ={ {'filename', path=1} },
      lualine_c = {},
      lualine_d = {},
      lualine_e = {},
    }
  })
  use({'voldikss/vim-floaterm'})
  use({'fatih/vim-go'})
  use({'whatyouhide/vim-gotham'})
  use({'nanotech/jellybeans.vim'})
  use({'sickill/vim-monokai'})
  use({'tpope/vim-fugitive'})
  use({'tpope/vim-rhubarb'})
  use({'gf3/peg.vim'})
  use({'nvim-lua/plenary.nvim'})

  use({ 'nvim-telescope/telescope.nvim', config = function () require('telescope').setup{ file_ignore_patterns = {'node_modules','./venv/'} } end })
  use({'nvim-telescope/telescope-project.nvim'})
  -- require'telescope'.load_extension('project')

  use({'puremourning/vimspector'})
  use({'airblade/vim-rooter'})

  -- Debugging
  use 'mfussenegger/nvim-dap'

  local rt = require('rust-tools')
  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
  })
  use({'lukas-reineke/indent-blankline.nvim'})

  use({'fredeeb/tardis.nvim', config = true })
  require('tardis-nvim').setup({
    keymap = {
        next = '<C-n>',       -- next entry in log (older)
        prev = '<C-m>',       -- previous entry in log (newer)
        quit = 'q',           -- quit all
        commit_message = 'm', -- show commit message for current commit in buffer
    },
    commits = 32,             -- max number of commits to read
  })

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
 	use({'nvim-treesitter/nvim-treesitter-refactor'})
	use({'RRethy/nvim-treesitter-textsubjects'})
  require("nvim-treesitter.configs").setup({
    highlight = { enable = true, disable = { "lua" } },
    indent = { enable = true },
    refactor = { highlight_definitions = { enable = true } },
    matchup = { enable = true },
  })


end
