vim.g.have_nerd_font = true
require("vim._core.ui2").enable({})

-- KEYBINDINGS --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window virtically" })
vim.keymap.set("n", "<leader>sh", ":hsplit<cr>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>", { desc = "Increase window horizontal size" })
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>", { desc = "Decrease window horizontal size" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>", { desc = "Increase window vertical size" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>", { desc = "Decrease window vertical size" })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<cr>", { desc = "Move to previous buffer" })

-- Delete buffer
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", { desc = "Close current buffer" })

-- Clear highlights on search
vim.keymap.set("n", "<ESC>", ":nohlsearch<cr>", { desc = "Clear highlights on search" })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Remove indent from selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Add indent to selection" })

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move fouces to the left terminal" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move fouces to the lower terminal" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move fouces to the upper terminal" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move fouces to the right terminal" })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Autocomplete --
-- Activate completion
vim.keymap.set("i", "<C-space>", ":lua vim.lsp.completion.get()<cr>")

-- OPTIONS --
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.completeopt = "menu,menuone,popup,fuzzy,noselect"
vim.o.winborder = "rounded"
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.mouse = "nvi"
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.fileencoding = "utf-8"
vim.o.fileformat = "unix"
vim.o.fileformats = "unix,dos"
if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep --no-hidden --no-heading"
	vim.o.grepformat = "%f:%l:%c:%m"
end
vim.diagnostic.config({ virtual_lines = { current_line = true } })

-- PLUGINS --
vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/julianolf/nvim-dap-lldb",
})

vim.cmd.colorscheme("tokyonight-night")

require("mini.icons").setup()
require("mini.extra").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.pick").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.files").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()
require("mini.surround").setup()
require("mini.ai").setup({
	mappings = {
		around_next = "aa",
		inside_next = "ii",
	},
	n_lines = 500,
})
require("mason").setup()
require("nvim-treesitter").setup({
	autotag = {
		enable = true,
	},
})

-- Plugins keybindings --
-- [Mini.Files]
local minifiles_toggle = function(...)
	if not MiniFiles.close() then
		MiniFiles.open(...)
	end
end
vim.keymap.set("n", "-", minifiles_toggle, { desc = "Open parent directory" })

-- [Mini.Pick]
local pick = require("mini.pick").builtin
local pickEx = require("mini.extra").pickers
vim.keymap.set("n", "<leader>ph", pick.help, { desc = "Pick Help" })
vim.keymap.set("n", "<leader>pk", pickEx.keymaps, { desc = "Pick Keymaps" })
vim.keymap.set("n", "<leader>pf", pick.files, { desc = "Pick Files" })
vim.keymap.set("n", "<leader>pw", pick.grep, { desc = "Pick current Word" })
vim.keymap.set("n", "<leader>pg", pick.grep_live, { desc = "Pick by Grep" })
vim.keymap.set("n", "<leader>pd", pickEx.diagnostic, { desc = "Pick Diagnostics" })
vim.keymap.set("n", "<leader>pq", function()
	pick.list({ scope = "quickfix" })
end, { desc = "Pick Quickfix" })
vim.keymap.set("n", "<leader>pr", pick.resume, { desc = "Pick Resume" })
vim.keymap.set("n", "<leader><leader>", pick.buffers, { desc = "Pick existing buffers" })

-- [Trouble]
local trouble = require("trouble")
vim.keymap.set("n", "<leader>xx", function()
	trouble.toggle({ source = "diagnostics" })
end, { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", function()
	trouble.toggle({ source = "diagnostics", filter = { buf = 0 } })
end, { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>cs", function()
	trouble.toggle({ source = "symbols", focus = false })
end, { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leader>cl", function()
	trouble.toggle({ source = "lsp", focus = false, win = { position = "right" } })
end, { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leader>xL", function()
	trouble.toggle({ source = "loclist" })
end, { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", function()
	trouble.toggle({ source = "qflist" })
end, { desc = "Quickfix List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", function()
	trouble.toggle("qflist")
end, { desc = "Quickfix List (Trouble)" })

-- [Dap]
local dap = require("dap")
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle breakpoint" })
vim.keymap.set("n", "<F7>", dap.continue, { desc = "DAP continue" })
vim.keymap.set("n", "<F8>", dap.step_over, { desc = "DAP step over" })
vim.keymap.set("n", "<F9>", dap.step_into, { desc = "DAP step into" })
vim.keymap.set("n", "<F10>", dap.step_out, { desc = "DAP step out" })
vim.keymap.set("n", "<Leader>w", require("dap-view").toggle, { desc = "DAP View Toggle" })

-- LSP navigation
local pickers = require("mini.extra").pickers

vim.keymap.set("n", "grd", function()
	pickers.lsp({ scope = "definition" })
end, { desc = "Go to Definition" })

vim.keymap.set("n", "grr", function()
	pickers.lsp({ scope = "references" })
end, { desc = "Go to References" })

vim.keymap.set("n", "gri", function()
	pickers.lsp({ scope = "implementation" })
end, { desc = "Go to Implementation" })

vim.keymap.set("n", "grD", function()
	pickers.lsp({ scope = "declaration" })
end, { desc = "Go to Declaration" })

vim.keymap.set("n", "grt", function()
	pickers.lsp({ scope = "type_definition" })
end, { desc = "Go to Type Definition" })

vim.keymap.set("n", "gO", function()
	pickers.lsp({ scope = "document_symbol" })
end, { desc = "Document Symbols" })

vim.keymap.set("n", "gW", function()
	pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "Workspace Symbols" })

-- LSPs --
vim.lsp.config("lua_ls", {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = { "lua/?.lua", "lua/?/init.lua" },
			},
			workspace = {
				checkThirdParty = false,
				-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
				--  See https://github.com/neovim/nvim-lspconfig/issues/3189
				library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				}),
			},
		})
	end,
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			format = { enable = false }, -- Disable formatting (formatting is done by stylua)
		},
	},
})
vim.lsp.enable({ "lua_ls", "gopls", "zls", "html", "ts_ls", "rust_analyzer" })

-- AUTOCOMMANDS --
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Format on save",
	group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client:supports_method("textDocument/formatting") then
			local group = vim.api.nvim_create_augroup("lsp-format-" .. buf, { clear = true })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = group,
				buffer = buf,
				callback = function()
					vim.lsp.buf.format({
						bufnr = buf,
						timeout_ms = 1000,
					})
				end,
			})
		end
	end,
})

local augroup = vim.api.nvim_create_augroup("user-config", {})

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Return to last edit position when opening files",
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto-resize splits when window is resized",
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
