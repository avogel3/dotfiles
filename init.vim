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

nnoremap <C-h>   :tabpre<CR>
nnoremap <C-l>   :tabnext<CR>

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

call plug#end()

let g:turbux_command_prefix = 'bundle exec'

iabbr bpry require'pry';binding.pry

nnoremap <leader>p :GFiles<CR>

" Shift + Tab
inoremap <S-Tab> <C-d>

let g:startify_bookmarks = ['~/.zshrc', '~/.config/nvim/init.vim', '~/.ackrc']

colorscheme purify

let g:lightline = {
                \ 'colorscheme': 'purify',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
                \ }
                \ }
