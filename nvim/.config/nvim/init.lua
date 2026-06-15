vim.g.have_nerd_font = true
require("vim._core.ui2").enable({})

-- KEYBINDINGS --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move focus to the right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<cr>", { desc = "Split window virtically" })
vim.keymap.set("n", "<leader>sh", ":hsplit<cr>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<c-up>", ":resize +2<cr>", { desc = "Increase window horizontal size" })
vim.keymap.set("n", "<c-down>", ":resize -2<cr>", { desc = "Decrease window horizontal size" })
vim.keymap.set("n", "<c-left>", ":vertical resize -2<cr>", { desc = "Increase window vertical size" })
vim.keymap.set("n", "<c-right>", ":vertical resize +2<cr>", { desc = "Decrease window vertical size" })

-- Navigate buffers
vim.keymap.set("n", "<c-l>", ":bnext<cr>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<c-h>", ":bprevious<cr>", { desc = "Move to previous buffer" })

-- Delete buffer
vim.keymap.set("n", "<leader>q", ":bdelete<cr>", { desc = "Close current buffer" })

-- Clear highlights on search
vim.keymap.set("n", "<esc>", ":nohlsearch<cr>", { desc = "Clear highlights on search" })

-- Center on search result
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Remove indent from selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Add indent to selection" })

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<c-h>", "<c-\\><c-N><c-w>h", { desc = "Move fouces to the left terminal" })
vim.keymap.set("t", "<c-j>", "<c-\\><c-N><c-w>j", { desc = "Move fouces to the lower terminal" })
vim.keymap.set("t", "<c-k>", "<c-\\><c-N><c-w>k", { desc = "Move fouces to the upper terminal" })
vim.keymap.set("t", "<c-l>", "<c-\\><c-N><c-w>l", { desc = "Move fouces to the right terminal" })

-- Exit terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal mode" })

-- Autocomplete --
-- Activate completion
vim.keymap.set("i", "<c-space>", function() vim.lsp.completion.get() end)

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
vim.o.autoread = true
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"
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
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/julianolf/nvim-dap-lldb",
})

vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("nvim.undotree")

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
require("mini.cmdline").setup()
require("mini.completion").setup({
	lsp_completion = {
		auto_setup = true,
	}
})
require("mini.ai").setup({
	mappings = {
		around_next = "aa",
		inside_next = "ii",
	},
	n_lines = 500,
})
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
	snippets = {
		MiniSnippets.gen_loader.from_lang(),
	},
})
MiniSnippets.start_lsp_server({ match = false })
require("mason").setup()
require("nvim-treesitter").setup({
	autotag = {
		enable = true,
	},
})

-- Plugins keybindings --
-- [Nvim.Undotree]
vim.keymap.set("n", "<leader>ut", function()
	require("undotree").open()
end, { noremap = true, silent = true, desc = "Toggle undotree" })

-- [Nvim.Difftool]
_G.__nvim_difftool_temps = _G.__nvim_difftool_temps or {}
_G.__nvim_difftool_bufs = _G.__nvim_difftool_bufs or {}

local function difftool_is_open()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.tbl_contains(_G.__nvim_difftool_bufs, buf) then return true end
	end
	return false
end

local function cleanup_difftool()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.tbl_contains(_G.__nvim_difftool_bufs, buf) then
			pcall(vim.api.nvim_win_close, win, true)
		end
	end

	for _, buf in ipairs(_G.__nvim_difftool_bufs) do
		if vim.api.nvim_buf_is_valid(buf) then
			pcall(vim.api.nvim_buf_delete, buf, {force = true})
		end
	end
	_G.__nvim_difftool_bufs = {}

	for _, f in ipairs(_G.__nvim_difftool_temps) do pcall(os.remove, f) end
	_G.__nvim_difftool_temps = {}
end

local function write_blob_to_temp(ref, relpath, git_root)
	local cmd = {"git", "-C", git_root, "show", ref .. ":" .. relpath }
	local out = vim.fn.systemlist(cmd)
	if vim.v.shell_error ~= 0 then return nil end
	local tmp = vim.fn.tempname()
	vim.fn.writefile(out, tmp)
	table.insert(_G.__nvim_difftool_temps, tmp)
	return tmp
end

vim.keymap.set('n', '<leader>dt', function()
	if difftool_is_open() then cleanup_difftool(); return end

	local bufname = vim.api.nvim_buf_get_name(0)
	if bufname == "" then
		vim.notify("Buffer has no file (save it first)", vim.log.levels.WARN)
		return
	end

	-- repo root
	local git_root = vim.fn.systemlist({"git", "rev-parse", "--show-toplevel"})[1]
	if vim.v.shell_error ~= 0 or git_root == nil or git_root == "" then
		vim.notify("Not in git respository", vim.log.levels.WARN)
		return
	end

	-- compute path relative to repo root
	local abs_path = vim.fn.fnamemodify(bufname, ":p")
	local pattern = "^" .. vim.pesc(git_root) .. "/?"
	local relpath = abs_path:gsub(pattern, "")

	-- ensure tracked
	vim.fn.system({"git", "ls-files", "--error-unmatch", "--", relpath })
	if vim.v.shell_error ~= 0 then
		vim.notify("File not tracked in git", vim.log.levels.WARN)
		return
	end


	local left = write_blob_to_temp("HEAD", relpath, git_root)
	if not left then
		vim.notify("Could not read blob from git", vim.log.levels.ERROR)
		return
	end

	local right = bufname
	if vim.bo.modified then
		local tmp_right = vim.fn.tempname()
		vim.api.nvim_buf_call(0, function()
			vim.cmd("write! " .. vim.fn.fnameescape(tmp_right))
		end)
		table.insert(_G.__nvim_difftool_temps, tmp_right)
		right = tmp_right
	end

	local before_bufs = {}
	for _, b in ipairs(vim.api.nvim_list_bufs()) do before_bufs[b] = true end

	require("difftool").open(left, right)

	_G.__nvim_difftool_bufs = {}
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if not before_bufs[b] then table.insert(_G.__nvim_difftool_bufs, b) end
	end
end, { noremap=true, silent=true, desc='Diff current file vs git' })

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

-- [Dap]
local dap = require("dap")
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle breakpoint" })
vim.keymap.set("n", "<f7>", dap.continue, { desc = "DAP continue" })
vim.keymap.set("n", "<f8>", dap.step_over, { desc = "DAP step over" })
vim.keymap.set("n", "<f9>", dap.step_into, { desc = "DAP step into" })
vim.keymap.set("n", "<f10>", dap.step_out, { desc = "DAP step out" })
vim.keymap.set("n", "<leader>w", require("dap-view").toggle, { desc = "DAP View Toggle" })

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

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
	desc = "Auto-format",
	group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
	callback = function(event)
		local buf = event.buf
		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

		if client:supports_method("textDocument/formatting") then
			local group = vim.api.nvim_create_augroup("my.lsp.format." .. buf, { clear = true })

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

local augroup = vim.api.nvim_create_augroup("user.config", {})

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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight wen yanking text",
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})
