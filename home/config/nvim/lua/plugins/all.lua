-- NOTE: lazy.nvim reads plugins/*.lua, so feel free to break these up into convenient chunks

return {
  { 'SirVer/ultisnips' },
  { 'honza/vim-snippets' },

  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'lspconfig'.gopls.setup { 'gopls' }
    end
  },

  {
    'simrat39/rust-tools.nvim',
    config = function()
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
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      -- Completion Plugin Setup
      local cmp = require 'cmp'
      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Add tab support
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        -- Installed sources:
        sources = {
          { name = 'path' },                                       -- file paths
          { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
          { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
          { name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
          { name = 'buffer',                 keyword_length = 2 }, -- source current buffer
          { name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          { name = 'calc' },                                       -- source for math calculation
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/vim-vsnip' },

  { 'atelierbram/vim-colors_atelier-schemes' },
  -- {'liuchengxu/space-vim-dark'},

  { 'robertmeta/nofrils' },
  { 'vim-test/vim-test' },
  { 'hashivim/vim-terraform' },
  { 'rmagatti/auto-session' },
  { 'ludovicchabant/vim-gutentags' },
  { 'preservim/nerdtree' },
  { 'junegunn/fzf' }, -- FIXME: Not sure what this does? dir = '~/.fzf'
  { 'junegunn/fzf.vim' },
  { 'mhinz/vim-startify' },
  { 'jeetsukumaran/vim-buffergator' },
  { 'ap/vim-buftabline' },
  { 'airblade/vim-gitgutter' },
  { 'majutsushi/tagbar' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons', lazy = true },
    }
  },
  {
    'arkav/lualine-lsp-progress',
    config = function()
      require('lualine').setup({
        options = { theme = 'palenight' },
        sections = {
          lualine_b = { { 'filename', path = 1 } },
          lualine_c = {
            'lsp_progress'
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { { 'filename', path = 1 } },
          lualine_c = {},
          lualine_d = {},
          lualine_e = {},
        }
      })
    end
  },
  { 'voldikss/vim-floaterm' },
  { 'fatih/vim-go' },
  { 'whatyouhide/vim-gotham' },
  { 'nanotech/jellybeans.vim' },
  { 'sickill/vim-monokai' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'gf3/peg.vim' },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup { file_ignore_patterns = {
        'node_modules', './venv/' } }
    end
  },
  { 'nvim-telescope/telescope-project.nvim' },
  -- require'telescope'.load_extension('project')

  { 'puremourning/vimspector' },
  { 'airblade/vim-rooter' },

  -- Debugging
  { 'mfussenegger/nvim-dap' },

  { 'lukas-reineke/indent-blankline.nvim' },

  {
    'fredeeb/tardis.nvim',
    config = function()
      require('tardis-nvim').setup({
        keymap = {
          next = '<C-n>',       -- next entry in log (older)
          prev = '<C-m>',       -- previous entry in log (newer)
          quit = 'q',           -- quit all
          commit_message = 'm', -- show commit message for current commit in buffer
        },
        commits = 32,           -- max number of commits to read
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true, disable = { "lua" } },
        indent = { enable = true },
        refactor = { highlight_definitions = { enable = true } },
        incremental_selection = { enable = true },
        matchup = { enable = true },
        textsubjects = {
          enable = true,
          prev_selection = ",",
          keymaps = {
            ["."] = "textsubjects-smart",
          },
        },
      })
    end
  },
  { 'nvim-treesitter/nvim-treesitter-refactor' },
  { 'RRethy/nvim-treesitter-textsubjects' },
}
