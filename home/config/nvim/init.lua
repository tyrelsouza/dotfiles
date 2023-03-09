require("settings")

vim.g.python3_host_prog = '/opt/nvimpython/.nvim.pythonenv/bin/python3'

-- Install Packer automatically:
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  require("plugins")(use)

  local packer_bootstrap = ensure_packer()
  if packer_bootstrap then
    require('packer').sync()
  end

  require("mason").setup()

  local rt = require("rust-tools")
  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
  })
  -- LSP Diagnostics Options Setup 
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
  end
  
  sign({name = 'DiagnosticSignError', text = ''})
  sign({name = 'DiagnosticSignWarn', text = ''})
  sign({name = 'DiagnosticSignHint', text = ''})
  sign({name = 'DiagnosticSignInfo', text = ''})
  
  vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = false,
      float = {
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
      },
  })
  
  vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
  ]])


  -- Completion Plugin Setup
  local cmp = require'cmp'
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
      { name = 'path' },                              -- file paths
      { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
      { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
      { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
      { name = 'buffer', keyword_length = 2 },        -- source current buffer
      { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
      { name = 'calc'},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
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

	require("nvim-treesitter.configs").setup({
		highlight = { enable = false, disable = { "lua" } },
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


  -- KEYS
  -- Vimspector
  vim.cmd([[
    nmap <Leader><F6> <cmd>call vimspector#Launch()<cr>
    nmap <Leader><F7> <cmd>call vimspector#StepOver()<cr>
    nmap <Leader><F4> <cmd>call vimspector#Reset()<cr>
    nmap <Leader><F11> <cmd>call vimspector#StepOver()<cr>
    nmap <Leader><F12> <cmd>call vimspector#StepOut()<cr>
    nmap <Leader><F10> <cmd>call vimspector#StepInto()<cr>
    nmap <Leader>Db <cmd>:call vimspector#ToggleBreakpoint()<cr>
    nmap <Leader>Dw <cmd>:call vimspector#AddWatch()<cr>
    nmap <Leader>De <cmd>:call vimspector#Evaluate()<cr>
  ]])

  -- OPTS
  vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
  vim.opt.shortmess = vim.opt.shortmess + { c = true}
  vim.api.nvim_set_option('updatetime', 300) 
  
  -- Fixed column for diagnostics to appear
  -- Show autodiagnostic popup on cursor hover_range
  -- Goto previous / next diagnostic warning / error 
  -- Show inlay_hints more frequently 
  vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
  ]])
  
  
  
  vim.cmd([[
  let g:vimspector_sidebar_width = 85
  let g:vimspector_bottombar_height = 15
  let g:vimspector_terminal_maxwidth = 70
  ]])



end)
