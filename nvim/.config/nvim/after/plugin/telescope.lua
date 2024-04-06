local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("dap")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "<leader>pe", ":Telescope file_browser<CR>", { noremap = true })
