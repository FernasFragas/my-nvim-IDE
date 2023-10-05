
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local util_status, util = pcall(require, "lspconfig/util")
if not util_status then
  return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp server is available
local on_attach = function(client, bufnr)
  --keybind opts
  local opts = { noremap = true, silent = true, buffer = bufnr}

  -- set keybinds
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlienToggle<CR>", opts)

end

-- enable autocompletion 
local capabilities = cmp_nvim_lsp.default_capabilities()

-- configure golang server
lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        assign = true,
        atomic = true,
        bools = true,
        composites = true,
        copylocks = true,
        deepequalerrors = true,
        embed = true,
        errorsas = true,
        fieldalignment = true,
        httpresponse = true,
        ifaceassert = true,
        loopclosure = true,
        lostcancel = true,
        nilfunc = true,
        nilness = true,
        nonewvars = true,
        printf = true,
        shadow = true,
        shift = true,
        simplifycompositelit = true,
        simplifyrange = true,
        simplifyslice = true,
        sortslice = true,
        stdmethods = true,
        stringintconv = true,
        structtag = true,
        testinggoroutine = true,
        tests = true,
        timeformat = true,
        unmarshal = true,
        unreachable = true,
        unsafeptr = true,
        unusedparams = true,
        unusedresult = true,
        unusedvariable = true,
        unusedwrite = true,
        useany = true,
      },
      hoverKind = "FullDocumentation",
      linkTarget = "pkg.go.dev",
      usePlaceholders = true,
      vulncheck = "Imports",
    },
  },
})
