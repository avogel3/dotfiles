-- NVIM Tree Sitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "eex",
    "heex",
    "elixir",
    "ruby",
    "html",
    "sql",
    "css",
    "json",
    "graphql",
    "go",
    "erlang",
    "javascript",
    "typescript",
    "jsdoc",
    "scss",
    "toml",
    "yaml"
  },
  highlight = {
    enable = true
  },
  endwise = {
    enable = true
  }
}

-- lualine
require('lualine').setup {
  sections = {
    lualine_c = {
      {
        'buffers',
        show_filename_only = false
      }
    }
  }
}
