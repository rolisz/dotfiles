" Vundle bundles 
filetype off

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Raimondi/delimitMate'
Bundle 'Tagbar'
Bundle 'tpope/vim-surround'

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
set hlsearch
nnoremap <leader><space> :noh<cr>
set scrolloff=2
set sidescrolloff=5
set history=1000
set shiftround
set colorcolumn=80
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

noremap <leader># :s/^\([\t\ ]*[^\ \t#]\+\)\&/#\ /<CR>
nmap <F8> :TagbarToggle<CR>

" YCM setup
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Syntastic
let g:syntastic_python_checkers=['pep8', 'pyflakes', 'pylint', 'python']
