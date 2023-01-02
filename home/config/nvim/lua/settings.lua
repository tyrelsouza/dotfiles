vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.shell = "/usr/local/bin/fish"

vim.opt.history = 1000
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.mouse = "" -- disable
-- vim.opt.ruler = true -- Position at the bottom of the screen
vim.opt.joinspaces = false
vim.opt.hidden = true
vim.opt.previewheight = 5
-- 
vim.opt.shortmess = vim.o.shortmess .. "atI"
vim.opt.lazyredraw = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Global settings
vim.opt.autochdir = true -- Keep vim's directory context same as the current buffer
vim.opt.listchars = "tab:> ,trail:.,extends:$,nbsp:_"
vim.opt.fillchars = "fold:-"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.wildmode = "list:longest" -- Autocomplete

-- Buffer settings
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 4
vim.opt.tabstop = 2
vim.opt.undofile = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.colors = "Atelier_SulphurpoolDark"
vim.g.floaterm_keymap_toggle = '<F9>'
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9


vim.g.tagbar_autofocus=1



-- Highlight yank
vim.api.nvim_command([[
  au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
]])

-- TODO: ... the rest of plugin/legacy.vim

local map = vim.api.nvim_set_keymap
local function t(str) -- Convert termcodes for mapping
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
		return t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t("<S-Tab>")
	end
end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

map("v", ">", ">gv", {}) -- Retain visual select when indenting
map("v", "<", "<gv", {}) -- Retain visual select when indenting


vim.api.nvim_set_keymap("n", "<Leader>bq",":bp <BAR> bd #<CR>", {silent=true})

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files<cr>", {silent=true})
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<cr>", {silent=true})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<cr>", {silent=true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":Ag<cr>", {silent=true})

vim.api.nvim_set_keymap("n", "<leader>gb",":.GBrowse<CR>", {silent=true})

vim.api.nvim_set_keymap("n", "<C-J>", ":bprev<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-K>", ":bnext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-o>", ":NERDTreeToggle<CR>", {silent = true})

vim.api.nvim_set_keymap("n", "<F1>", ":set invnumber invrelativenumber<CR>", {silent = true })
vim.api.nvim_set_keymap("n", "<F2>",":SearchSession<CR>", {silent = true })
vim.api.nvim_set_keymap("n", "<F8>", ":Tagbar<CR>", {silent = true })


