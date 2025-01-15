-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-ö>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("t", "<C-ö>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Map some commands on the German keyboards layouts to their original places.
map({ "n", "o", "x" }, "ö", ";", { remap = true })
map({ "n", "o", "x" }, "Ö", ",", { remap = true })
map({ "n", "o", "x" }, "ä", "'", { remap = true })
map({ "n", "o", "x" }, "Ä", '"', { remap = true })
map({ "n", "o", "x" }, "ü", "[", { remap = true })
map({ "n", "o", "x" }, "Ü", "{", { remap = true })
map({ "n", "o", "x" }, "+", "]", { remap = true })
map({ "n", "o", "x" }, "*", "}", { remap = true })
map({ "n", "o", "x" }, "-", "/", { remap = true })
map({ "n", "o", "x" }, "_", "?", { remap = true })

map("n", "^", "<C-^>")
map("n", "0", "^")

map("n", "<leader>cp", function()
  vim.lsp.buf.execute_command({ command = "tinymist.pinMain", arguments = { vim.api.nvim_buf_get_name(0) } })
end, { desc = "Pin Typst root document" })

-- vim.cmd("ASToggle")
