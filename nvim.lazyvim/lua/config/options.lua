-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.guifont = "FiraCode Nerd Font Mono:h10"

vim.g.neovide_title_background_color = "green"
-- string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

vim.g.neovide_title_text_color = "white"

-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"

vim.o.report = 8
vim.o.spell = false
vim.o.spelllang = "en_us,de_20"

vim.o.matchpairs = vim.o.matchpairs .. ",<:>"

vim.o.winblend = 35
vim.o.pumblend = 35
