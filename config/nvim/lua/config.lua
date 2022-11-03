-- NVIM Tree Sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "eex", "heex", "elixir", "ruby", "html" },
  highlight = {
    enable = true
  },
  endwise = {
    enable = true
  }
}
