vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

return function(use)
  -- Prevents reinstall of treesitter plugins every boot
  -- local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
  -- vim.fn.mkdir(parser_install_dir, "p")
  -- vim.opt.runtimepath:append(parser_install_dir)

  -- -- Treesitter is managed by the package config, we just manage configs/deps here
  -- use({ "nvim-treesitter/nvim-treesitter-refactor" })
  -- use({ "RRethy/nvim-treesitter-textsubjects" })
  -- require("nvim-treesitter.configs").setup({
  --   parser_install_dir = parser_install_dir,
  -- })

  use({'atelierbram/vim-colors_atelier-schemes'})
  use({'robertmeta/nofrils'})
  use({'vim-test/vim-test'})
  use({'hashivim/vim-terraform'})
  use({'rmagatti/auto-session'})
  use({'ludovicchabant/vim-gutentags'})
  -- use({'ervandew/supertab'})
  use({'preservim/nerdtree'})
  use({'liuchengxu/space-vim-dark'})
  use({'junegunn/fzf', dir='~/.fzf'})
  use({'junegunn/fzf.vim'})
  use({'mhinz/vim-startify'})
  use({'jeetsukumaran/vim-buffergator'})
  use({'ap/vim-buftabline'})
  use({'airblade/vim-gitgutter'})
  use({'majutsushi/tagbar'})
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use({'voldikss/vim-floaterm'})
  use({'fatih/vim-go'})
  use({'whatyouhide/vim-gotham'})
  use({'nanotech/jellybeans.vim'})
  use({'sickill/vim-monokai'})
  use({'tpope/vim-fugitive'})
  use({'tpope/vim-rhubarb'})
  use({'gf3/peg.vim'})
  use({'nvim-lua/plenary.nvim'})


  use({
    'nvim-telescope/telescope.nvim',
    config = function () require('telescope').setup{ file_ignore_patterns = {"node_modules","./venv/"} } end
  })

end
