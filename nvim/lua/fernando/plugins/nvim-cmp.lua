local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then 
  return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"


cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggest
    ["<C-j>"] =  cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({select = false}),
  }),
  -- src of autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, --lsp
    { name = "luasnip"}, --snipets
    { name = "buffer" }, -- text within current buffer(aka file)
    { name = "path" }, -- system directories
  }),
})
