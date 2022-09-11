if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'scrooloose/nerdcommenter'
let g:NERDTrimTrailingWhitesace = 1

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'hoob3rt/lualine.nvim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elixir-editors/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-pairs',
\ 'coc-json',
\ 'coc-css',
\ 'coc-python',
\ 'coc-sh',
\ 'coc-tsserver',
\ 'coc-explorer',
\ 'coc-elixir',
\ 'coc-tailwindcss'
\ ]

" Python
let g:python3_host_prog = "/usr/bin/python3"

" Theme
"Plug 'mhartington/oceanic-next'
Plug 'overcache/NeoSolarized'

call plug#end()



" Auto commands
" automatically close preview window when done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" resize windows when terminal was resized
autocmd VimResized * execute "normal! \<c-w>="

"autocmd BufWritePost *.exs,*.ex silent :!mix format


" Settings
set showcmd
set autoindent
syntax enable
colorscheme NeoSolarized
set cmdheight=1                     " set command view height
set noshowmode                      " don't display insert/normal/visual mode, we have a status line for that
set scrolloff=5                     " scroll 5 lines before start/end of viewport
set shiftwidth=2                    " 2 spaces
set tabstop=4                       " 2 spaces
set relativenumber                  " relative line numbers
set ignorecase                      " when searching lower case, also find upper case
set smartcase                       " turn of lower case results when explicitly searching for upper case
set diffopt=filler,vertical         " start diff in vertical split and show filler lines
set autoread                        " automatically read file when changed, this currently only triggers when vim has focus
set completeopt=menuone,preview     " show auto complete also of only one match and open preview window
let &showbreak = '↳ '               " arrow when text breaks into next line
set breakindent                     " indent wrapped lines to match start
set breakindentopt=sbr              " display showbreak before applying additional indent
set encoding=utf-8                  " set the character encoding to UTF-8
set visualbell                      " don't beep
set noerrorbells                    " don't beep
set nojoinspaces                    " don't autoinsert two spaces after '.', '?', '!' for join command
set hidden                          " allow buffer hiding without save
set inccommand=split                " nice preview of search and replace actions
set showmatch                       " show matching brackets
set hlsearch                        " highlight all search matches
set colorcolumn=120                 " display a column after 120
set foldmethod=indent               " fold with indentation method
set foldlevelstart=99               " no initial folding
set updatetime=300                 " when to execute CursorHold
set shortmess+=c 					" Don't pass messages to ins-completion-menu
set nobackup
set nowritebackup

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" use gui background/foreground
if (has("termguicolors"))
 set termguicolors
endif

" set cursorline only for the current buffer
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" italic comment highlight
highlight Comment cterm=italic gui=italic

" remove underline from cursrorline
highlight CursorLine cterm=NONE

" clipboard
set clipboard=unnamedplus

" Key mappings
let mapleader = ';'

" Tabs
nnoremap <C-t> :tabedit<CR>
nnoremap <S-tab> :tabprev<CR>

" Files/folders
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <leader>e :CocCommand explorer<CR>

" write/quit
inoremap <C-s> <esc>:w<cr>
noremap  <C-s> :w<cr>
inoremap <C-q> <esc>:q<cr>
nnoremap <C-q> :q<cr>
nnoremap <leader>Q :q!<cr>
inoremap <leader>Q <esc>:q!<cr>

" Window controlers
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Misc
nnoremap <leader>pwf :echo expand("%p")<CR>
nnoremap <CR> :nohlsearch<cr><cr>
nnoremap <leader>a ggVG
nnoremap <leader>conf :vsplit $MYVIMRC<cr>
" fast escapse
inoremap jj <ESC>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

au BufRead,BufNewFile .eslintrc set filetype=json
au BufRead,BufNewFile *ex,*.eex,*.heex,*.leex,*.sface,*.lexs set filetype=elixir

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" reload files on file changes
augroup AutoSwap
  autocmd!
  autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
  " if swapfile is older than file itself, just get rid of it
  if getftime(v:swapname) < getftime(a:filename)
    call delete(v:swapname)
    let v:swapchoice = 'e'
  endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
  au!
  if !has("gui_running")
    "silent! necessary otherwise throws errors when using command
    "line window.
    autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
  endif
augroup END
