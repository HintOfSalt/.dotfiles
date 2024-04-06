local status_ok1, tokyonight = pcall(require, "tokyonight")
if not status_ok1 then
	return
end

tokyonight.setup({
	style = "night",
})

local status_ok2, poimandres = pcall(require, "poimandres")
if not status_ok2 then
    return
end

poimandres.setup({})

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
