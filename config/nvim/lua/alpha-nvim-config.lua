local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.header.val = {
       [[    ______                   _         __  __                      _           __   __   _ ____          ]],
       [[   / ____/__  ____ ______   (_)____   / /_/ /_  ___     ____ ___  (_)___  ____/ /  / /__(_) / /__  _____ ]],
       [[  / /_  / _ \/ __ `/ ___/  / / ___/  / __/ __ \/ _ \   / __ `__ \/ / __ \/ __  /  / //_/ / / / _ \/ ___/ ]],
       [[ / __/ /  __/ /_/ / /     / (__  )  / /_/ / / /  __/  / / / / / / / / / / /_/ /  / ,< / / / /  __/ /     ]],
       [[/_/    \___/\__,_/_/     /_/____/   \__/_/ /_/\___/  /_/ /_/ /_/_/_/ /_/\__,_/  /_/|_/_/_/_/\___/_/      ]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    dashboard.button("21", "init.lua", ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("22", ".gitconfig.local", ":e ~/.gitconfig.local<CR>"),
    dashboard.button("23", ".zshrc", ":e ~/.zshrc<CR>"),
    dashboard.button("24", ".arkrc", ":e ~/.ackrc<CR>"),
  }

local function footer()
  -- Number of plugins
  local datetime = os.date "%d-%m-%Y %H:%M:%S"
  local info_text = "   "
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "   "
    .. datetime

  -- Quote
  return info_text .. "\n"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.val = footer()
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
