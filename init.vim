call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'doums/barow'
Plug 'doums/barowGit'
Plug 'doums/barowLSP'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'unblevable/quick-scope'
Plug 'caenrique/nvim-toggle-terminal'
Plug 'mattn/emmet-vim'
call plug#end()

set termguicolors
let ayucolor="mirage"
colorscheme ayu
highlight Comment cterm=italic gui=italic

filetype plugin indent on
set number relativenumber
set hidden
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set updatetime=50
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
set scrolloff=12
set signcolumn=yes

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler

set undolevels=1000
set backspace=indent,eol,start

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab

nnoremap <SPACE> <Nop>
let mapleader=" "

" Navigation
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>

" Buffers
nnoremap <silent> <C-K> :bnext<CR>
nnoremap <silent> <C-J> :bprev<CR>
nnoremap <silent> <leader>bd :bdelete<CR>

" Vim source
nnoremap <silent> <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>ve :e ~/.config/nvim/init.vim<CR>

" Stuff
nnoremap <silent> <leader>nh :noh<CR>

" Yank
nnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>y "+y
nnoremap <silent> <leader>Y gg"+yG
vnoremap <silent> <leader>Y gg"+yG

" Telescope mappings
nnoremap <silent> <leader>pp <cmd>Telescope find_files theme=get_dropdown prompt_prefix=🔍 find_command=rg,--hidden,--files,--glob,!.git,--glob,!node_modules<CR>
nnoremap <silent> <leader>ps <cmd>Telescope live_grep theme=get_dropdown prompt_prefix=🔍<CR>
nnoremap <silent> <leader>pb <cmd>Telescope buffers theme=get_dropdown prompt_prefix=🔍 ignore_current_buffer=true<CR>
nnoremap <silent> <leader>pg <cmd>Telescope git_files theme=get_dropdown prompt_prefix=🔍<CR>
nnoremap <silent> <leader>co <cmd>Telescope git_branches theme=get_dropdown prompt_prefix=🔍<CR>

" Fugitive mappings
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gP :G push<CR>
nnoremap <silent> <leader>gp :G pull<CR>

" Undotree mappings
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" CoC mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>d :<C-u>CocList diagnostics<cr>

" Toggle terminal
nnoremap <silent> <C-Z> :ToggleTerminal<Enter>
tnoremap <silent> <C-Z> <C-\><C-n>:ToggleTerminal<Enter>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Barow
let g:barow = {
      \  'modes': {
      \    'normal': [' ', 'BarowNormal'],
      \    'insert': ['i', 'BarowInsert'],
      \    'replace': ['r', 'BarowReplace'],
      \    'visual': ['v', 'BarowVisual'],
      \    'v-line': ['l', 'BarowVisual'],
      \    'v-block': ['b', 'BarowVisual'],
      \    'select': ['s', 'BarowVisual'],
      \    'command': ['c', 'BarowCommand'],
      \    'shell-ex': ['!', 'BarowCommand'],
      \    'terminal': ['t', 'BarowTerminal'],
      \    'prompt': ['p', 'BarowNormal'],
      \    'inactive': [' ', 'BarowModeNC']
      \  },
      \  'statusline': ['Barow', 'BarowNC'],
      \  'tabline': ['BarowTab', 'BarowTabSel', 'BarowTabFill'],
      \  'buf_name': {
      \    'empty': '',
      \    'hi': ['BarowBufName', 'BarowBufNameNC']
      \  },
      \  'read_only': {
      \    'value': 'ro',
      \    'hi': ['BarowRO', 'BarowRONC']
      \  },
      \  'buf_changed': {
      \    'value': '*',
      \    'hi': ['BarowChange', 'BarowChangeNC']
      \  },
      \  'tab_changed': {
      \    'value': '*',
      \    'hi': ['BarowTChange', 'BarowTChangeNC']
      \  },
      \  'line_percent': {
      \    'hi': ['BarowLPercent', 'BarowLPercentNC']
      \  },
      \  'row_col': {
      \    'hi': ['BarowRowCol', 'BarowRowColNC']
      \  },
		  \  'modules': [
      \    [ 'barowGit#branch', 'BarowHint' ],
      \    [ 'barowLSP#coc_status', 'StatusLine' ]
      \  ]
      \}
