" Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent execute "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▿'

Plug 'scrooloose/nerdcommenter'
let g:NERDTrimTrailingWhitesace = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_inactive_collapse=0
let g:airline_section_a = ''
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '%l'
let g:airline_theme='oceanicnext'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-pairs',
\ 'coc-css',
\ 'coc-html',
\ 'coc-json',
\ 'coc-tsserver'
\ ]

Plug 'pangloss/vim-javascript'
Plug 'junegunn/vim-easy-align'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/goyo.vim'

" Theme
Plug 'mhartington/oceanic-next'

call plug#end()


" Auto commands
" automatically close preview window when done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" resize windows when terminal was resized
autocmd VimResized * execute "normal! \<c-w>="

" Settings
set showcmd
set autoindent
syntax enable
colorscheme OceanicNext
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
set updatetime=1000                 " when to execute CursorHold
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

" Key mappings
let mapleader = ';'

" Buffers
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>
nnoremap <leader><Tab> :e#<cr>
nnoremap <leader>b :Buffers<cr>

" Files/folders
nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Rg<Space>
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>D :NERDTreeFind<cr>

" write/quit
inoremap <C-s> <esc>:w<cr>
noremap  <C-s> :w<cr>
inoremap <C-q> <esc>:q<cr>
nnoremap <C-q> :q<cr>
nnoremap <leader>Q :q!<cr>
inoremap <leader>Q <esc>:q!<cr>

" Tabs
nnoremap <C-l> gt

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
nnoremap <leader>conf :vsplit ~/.config/<cr>
" fast escapse
inoremap jj <ESC>

" CoC mappings
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
	call CocAction('doHover')
  endif
endfunction

" Auto commands
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

au BufRead,BufNewFile .eslintrc set filetype=json
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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
