" Vundle bundles 
filetype off

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
" Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-vinegar'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Raimondi/delimitMate'
Bundle 'Tagbar'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'JarrodCTaylor/vim-python-test-runner'
Bundle 'wting/gitsessions.vim'
" Bundle 'vim-scripts/YankRing.vim'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tmhedberg/SimpylFold'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'SirVer/ultisnips'
Bundle 'benmills/vimux'
Bundle 'takac/vim-hardtime'
Bundle 'justinmk/vim-sneak'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'itchyny/calendar.vim'

filetype indent plugin on

" Misc settings 

set nrformats-=octal
syntax on
set t_Co=256
cmap w!! w !sudo tee > /dev/null %

set background=dark
colorscheme solarized

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

set backspace=indent,eol,start

set number

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
set list

function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction
autocmd FileType python autocmd BufWritePre <buffer> :call TrimWhiteSpace()

call togglebg#map("<F5>")

set incsearch
set ignorecase
set smartcase
set gdefault
set hlsearch
nnoremap <leader><space> :noh<cr>
set scrolloff=2
set sidescrolloff=5
set history=1000
set shiftround
set colorcolumn=80
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" set mouse=a

noremap <leader># :s/^\([\t\ ]*[^\ \t#]\+\)\&/#\ /<CR>
nmap <F8> :TagbarToggle<CR>

" YCM setup
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Syntastic
let g:syntastic_python_checkers=['pep8', 'pyflakes', 'pylint', 'python']

" Splitting
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set splitbelow
set splitright


inoremap jj <ESC>

set virtualedit=block

set nobackup
set nowb
set noswapfile

" toggle between number and relative number on ,l
nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&relativenumber
    set relativenumber
  else
    set nu 
  endif
endfunction

noremap / /\v

nnoremap <leader>R :RainbowParenthesesToggle<cr>

set wildmenu

autocmd BufRead, BufNewFile *.md, *.rst setlocal spell

let g:calendar_google_calendar = 1
