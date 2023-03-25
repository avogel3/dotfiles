require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup{
  ensure_installed = {
          "cssls",
          "elixirls",
          "graphql",
          "html",
          "lua_ls",
          "lua_ls",
          "marksman",
          "standardrb",
          "rust_analyzer",
          "tsserver",
          "vimls",
          "yamlls"
  },
}
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
