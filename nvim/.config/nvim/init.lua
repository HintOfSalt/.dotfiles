-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.have_nerd_font = true

-----------------
-- KEYBINDINGS --
-----------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window horizontal size" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window horizontal size" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Increase window vertical size" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Decrease window vertical size" })

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Move to next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Move to previous buffer" })

-- Delete buffer
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", { desc = "Close current buffer" })

-- Clear highlights on search
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear highlights on search" })

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
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Autocomplete --
-- Activate completion
vim.keymap.set("i", "<C-space>", function() vim.lsp.completion.get() end)

-------------
-- OPTIONS --
-------------
vim.o.termguicolors = true
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.completeopt = "menu,menuone,popup,fuzzy,noselect"
vim.o.winborder = "rounded"

vim.o.cursorline = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"

vim.o.numberwidth = 4
vim.o.incsearch = true
vim.o.hlsearch = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.hidden = true
vim.o.scrolloff = 8

vim.o.mouse = "nvi"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true

vim.o.fileencoding = "utf-8"
vim.o.fileformat = "unix"
vim.o.fileformats = "unix,dos"

-------------
-- PLUGINS --
-------------
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        -- colorschemes
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme('tokyonight')
            end,
            opts = {
                style = "night",
            },
        },

        -- ui
        { "tpope/vim-sleuth" },
        { "nvim-lua/plenary.nvim",       lazy = true, },
        { "nvim-tree/nvim-web-devicons", lazy = true, enabled = vim.g.have_nerd_font },
        {
            "akinsho/bufferline.nvim",
            verion = "*",
            opts = {
                options = {
                    show_buffer_icons = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    show_tab_indicators = true,
                    always_show_bufferline = false,
                },
            },
        },
        {
            "nvim-lualine/lualine.nvim",
            opts = {
                options = {
                    icons_enabled = vim.g.have_nerd_font,
                    theme = "auto",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = {
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                        },
                    },
                    lualine_z = { "location" },
                },
            },
        },
        {
            "stevearc/oil.nvim",
            config = function()
                require("oil").setup({
                    keymaps = {
                        ["<C-h>"] = false,
                        ["<C-l>"] = false,
                        ["<C-k>"] = false,
                        ["<C-j>"] = false,
                        ["<M-h>"] = "actions.select_split",
                    },
                    view_options = { show_hidden = true },
                })

                -- Open parent directory in current window
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            end,
        },
        {
            "folke/which-key.nvim",
            event = "VimEnter",
            opts = {
                delay = 0,
                icons = {
                    mappings = vim.g.have_nerd_font,
                    keys = vim.g.have_nerd_font and {} or {
                        Up = "<UP> ",
                        Down = "<Down> ",
                        Left = "<Left> ",
                        Right = "<Right> ",
                        C = '<C-…> ',
                        M = '<M-…> ',
                        D = '<D-…> ',
                        S = '<S-…> ',
                        CR = '<CR> ',
                        Esc = '<Esc> ',
                        ScrollWheelDown = '<ScrollWheelDown> ',
                        ScrollWheelUp = '<ScrollWheelUp> ',
                        NL = '<NL> ',
                        BS = '<BS> ',
                        Space = '<Space> ',
                        Tab = '<Tab> ',
                        F1 = '<F1>',
                        F2 = '<F2>',
                        F3 = '<F3>',
                        F4 = '<F4>',
                        F5 = '<F5>',
                        F6 = '<F6>',
                        F7 = '<F7>',
                        F8 = '<F8>',
                        F9 = '<F9>',
                        F10 = '<F10>',
                        F11 = '<F11>',
                        F12 = '<F12>',
                    },
                },
                spec = {
                    { "<leader>s", group = "[S]earch" },
                    { "<leader>t", group = "[T]oggle" },
                    { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
                }
            },
        },

        -- lsp
        {
            "williamboman/mason.nvim",
            dependencies = {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
            },
            opts = {}
        },

        -- telescope
        {
            "nvim-telescope/telescope.nvim",
            event = "VimEnter",
            branch = "0.1.x",
            dependencies = {
                'nvim-lua/plenary.nvim',
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = 'make',
                    cond = function()
                        return vim.fn.executable('make') == 1
                    end
                },
                { 'nvim-telescope/telescope-ui-select.nvim' },
                {
                    'nvim-tree/nvim-web-devicons',
                    enabled = vim.g.have_nerd_font
                },
            },
            config = function()
                -- Two important keymaps to use while in Telescope are:
                --  - Insert mode: <c-/>
                --  - Normal mode: ?
                require('telescope').setup {
                    extensions = {
                        ['ui-select'] = {
                            require('telescope.themes').get_dropdown(),
                        },
                    },
                }

                -- Enable Telescope extensions if they are installed
                pcall(require('telescope').load_extension, 'fzf')
                pcall(require('telescope').load_extension, 'dap')
                pcall(require('telescope').load_extension, 'ui-select')

                -- See `:help telescope.builtin`
                local builtin = require 'telescope.builtin'
                vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
                vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
                vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
                vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
                vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
                vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
                vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
                vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
                vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
                vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

                -- Slightly advanced example of overriding default behavior and theme
                vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                        winblend = 10,
                        previewer = false,
                    })
                end, { desc = '[/] Fuzzily search in current buffer' })

                -- It's also possible to pass additional configuration options.
                --  See `:help telescope.builtin.live_grep()` for information about particular keys
                vim.keymap.set('n', '<leader>s/', function()
                    builtin.live_grep {
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                    }
                end, { desc = '[S]earch [/] in Open Files' })

                -- Shortcut for searching your Neovim configuration files
                vim.keymap.set('n', '<leader>sn', function()
                    builtin.find_files { cwd = vim.fn.stdpath 'config' }
                end, { desc = '[S]earch [N]eovim files' })
            end,
        },
        { "nvim-telescope/telescope-dap.nvim",       lazy = true },

        -- treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            opts = {
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "go",
                    "python",
                    "html",
                    "bash",
                    "json",
                    "markdown",
                    "tsx",
                    "yaml",
                    "dockerfile",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
            }
        },
        { "nvim-treesitter/nvim-treesitter-context", },
        {
            "windwp/nvim-autopairs",
            opts = {
                check_ts = true,
                ts_config = {
                    lua = { "string", "source" },
                    javascript = { "string", "template_string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                    offset = 0, -- Offset from pattern match
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "PmenuSel",
                    highlight_grey = "LineNr",
                },
            },
        },
        { "windwp/nvim-ts-autotag", opts = {}, },

        -- git
        {
            "lewis6991/gitsigns.nvim",
            opts = {
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
            },
        },
        { "tpope/vim-fugitive", },
        { "sindrets/diffview.nvim", lazy = true },

        -- debugging
        {
            "folke/trouble.nvim",
            opts = {},
            keys = {
                {
                    "<leader>xx",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "<leader>xX",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>cs",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>cl",
                    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
        {
            "mfussenegger/nvim-dap",
            dependencies = {
                { "leoluz/nvim-dap-go",              opts = {}, },
                { "theHamsta/nvim-dap-virtual-text", opts = {}, },
                { "rcarriga/nvim-dap-ui",            opts = {}, },
                "nvim-neotest/nvim-nio",
            },
            opts = {},
            config = function()
                local dap = require('dap')
                local dapui = require('dapui')
                dap.listeners.before.attach.dapui_config = function()
                    dapui.open()
                end
                dap.listeners.before.launch.dapui_config = function()
                    dapui.open()
                end
            end,
            keys = {
                {
                    "<F3>",
                    function()
                        require("dap").toggle_breakpoint()
                    end,
                    desc = "DAP Toggle breakpoint"
                },
                {
                    "<F4>",
                    function()
                        require("dap").toggle_breakpoint()
                    end,
                    desc = "DAP Toggle breakpoint"
                },
                {
                    "<F7>",
                    function()
                        require("dap").continue()
                    end,
                    desc = "DAP continue"
                },
                {
                    "<F8>",
                    function()
                        require("dap").step_over()
                    end,
                    desc = "DAP step over"
                },
                {
                    "<F9>",
                    function()
                        require("dap").step_into()
                    end,
                    desc = "DAP step into"
                },
                {
                    "<F10>",
                    function()
                        require("dap").step_out()
                    end,
                    desc = "DAP step out"
                },
                {
                    "<Leader>w",
                    function()
                        require("dapui").open()
                    end,
                    desc = "DAP open"
                },
                {
                    "<Leader>W",
                    function()
                        require("dapui").close()
                    end,
                    desc = "DAP close"
                },
            },
        },
    },

    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = false },
})

------------------
-- lsp config --
------------------
vim.lsp.config("luals", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
    on_init = function(client)
        local path = vim.tbl_get(client, "workspace_folders", 1, "name")
        if not path then
            return
        end
        -- override the lua-language-server settings for Neovim config
        client.settings = vim.tbl_deep_extend('force', client.settings, {
            Lua = {
                runtime = {
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- "${3rd}/luv/library"
                    }
                }
            }
        })
    end
})
vim.lsp.enable("luals")

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.mod", "go.work", ".git" }
})
vim.lsp.enable("gopls")

vim.lsp.config("zls", {
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    root_markers = { "zls.json", "build.zig", '.git' }
})
vim.lsp.enable('zls')

------------------
-- autocommands --
------------------
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Autocomplete and format on save",
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        if not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

vim.diagnostic.config({ virtual_lines = { current_line = true } })
