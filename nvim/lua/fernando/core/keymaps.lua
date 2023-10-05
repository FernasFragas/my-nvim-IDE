vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("n", "<leader>sv", "<C-w>v") -- space sv splits window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- space sh splits window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- OPEN NEW TAB
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>ty", "tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tr", "tabp<CR>") -- go to previous tab


-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
