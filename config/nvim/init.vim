filetype plugin indent on

syntax on

set number " turn on line numbers
set ignorecase " turn off case-sensitive search
set smartcase " case-sensitive search only when provided capital letters

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set expandtab
set smarttab
set cindent

command! Q :q
command! W :w
command! WQ :wq

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType typescript setlocal sw=2 ts=2 sts=2
au BufNewFile,BufRead Brewfile,.Brewfile set filetype=ruby syntax=brewfile

nnoremap <C-h>   :tabpre<CR>
nnoremap <C-l>   :tabnext<CR>

" find and replace convenience from Dorian who got it from Vidal
nmap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vmap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>

" Turn on :FZF
set rtp+=/usr/local/opt/fzf

call plug#begin('~/.config/nvim/plugged/')

Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'aliou/sql-heredoc.vim'
Plug 'rondale-sc/vim-spacejam'
Plug 'jgdavey/vim-turbux', {'branch': 'main'}
Plug 'jgdavey/tslime.vim', {'branch': 'main'} " turbux dep
Plug 'cakebaker/scss-syntax.vim'
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'digitaltoad/vim-pug'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require('config')
lua require('coc-mappings')

let g:turbux_command_prefix = 'bundle exec'

iabbr bpry require'pry';binding.pry

nnoremap <leader>p :GFiles<CR>

nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

" spectre keybindings
" search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
""  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

" Shift + Tab
inoremap <S-Tab> <C-d>

let g:startify_bookmarks = [
        \ '~/.zshrc',
        \ '~/.config/nvim/init.vim',
        \ '~/.ackrc',
        \ '~/.config/alacritty/alacritty.yml'
        \ ]

" Other options include - purify
colorscheme tokyonight-night

let g:lightline = {
                \ 'colorscheme': 'purify',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
                \ }
                \ }

let g:startify_custom_header = [
       \ '    ______                   _         __  __                      _           __   __   _ ____          ',
       \ '   / ____/__  ____ ______   (_)____   / /_/ /_  ___     ____ ___  (_)___  ____/ /  / /__(_) / /__  _____ ',
       \ '  / /_  / _ \/ __ `/ ___/  / / ___/  / __/ __ \/ _ \   / __ `__ \/ / __ \/ __  /  / //_/ / / / _ \/ ___/ ',
       \ ' / __/ /  __/ /_/ / /     / (__  )  / /_/ / / /  __/  / / / / / / / / / / /_/ /  / ,< / / / /  __/ /     ',
       \ '/_/    \___/\__,_/_/     /_/____/   \__/_/ /_/\___/  /_/ /_/ /_/_/_/ /_/\__,_/  /_/|_/_/_/_/\___/_/      ',
       \ ]
