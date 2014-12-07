if &shell =~# 'fish$'
    set shell=zsh
endif
set nocompatible
" Vundle bundles 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
" Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'Raimondi/delimitMate'
Plugin 'Tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'wting/gitsessions.vim'
" Plugin 'vim-scripts/YankRing.vim'
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'benmills/vimux'
Plugin 'takac/vim-hardtime'
Plugin 'justinmk/vim-sneak'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'itchyny/calendar.vim'
Plugin 'dag/vim-fish'
Plugin 'Rykka/clickable.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'caigithub/a_indent'
" Plugin 'vim-scripts/Session-Viminfo-Management'
Plugin 'godlygeek/tabular'
Plugin 'henrik/vim-indexed-search'
Plugin 'gcmt/wildfire.vim'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()  
filetype indent plugin on

autocmd filetype python nnoremap<C-n> :NosetestFile<CR>
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


let g:UltiSnipsExpandTrigger="<c-q>"

" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Powerline setup
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

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

set incsearch
set ignorecase
set smartcase
set gdefault
set hlsearch
set hidden
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
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
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
    set norelativenumber
  endif
endfunction

noremap / /\v

nnoremap <leader>R :RainbowParenthesesToggle<cr>
set pastetoggle=<F2>

vmap Q gq
nmap Q gqap

set wildmenu
set wildmode=longest:full,full

autocmd BufRead, BufNewFile *.md, *.rst setlocal spell

let g:calendar_google_calendar = 1

set wildignore=*.o,*~,*.pyc

autocmd FileType fish compiler fish
autocmd FileType fish setlocal foldmethod=expr

autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window 'vim " .  expand("%") . "'")

noremap <C-u> :call system("cmus-remote -u")<CR>
noremap <C-g> :call system("cmus-remote -k +2")<CR>
noremap <C-f> :call system("cmus-remote -k -2")<CR>
inoremap <C-u> <C-O>:call system("cmus-remote -u")<CR>
inoremap <C-g> <C-O>:call system("cmus-remote -k +2")<CR>
inoremap <C-f> <C-O>:call system("cmus-remote -k -2")<CR>
vmap v <Plug>(expand_region_expand)
vmap <S-v> <Plug>(expand_region_shrink)

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k   gk
    noremap  <buffer> <silent> j   gj
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
let g:netrw_list_hide= '.*\.pyc$'

nnoremap<C-n> :NosetestFile<CR>
nnoremap<C-l> :NosetestMethod<CR>

let g:ycm_autoclose_preview_window_after_completion = 1

let g:eighties_enabled = 1
let g:eighties_minimum_width = 80

function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<TAB>"
let g:UltiSnipsListSnippets="<TAB>"


let g:wildfire_objects = {
   \ '*' : ["i'", 'i"', 'i)', 'i]', 'i}', 'ip'],
   \ 'html,xml' : ["at"],
\ }

noremap <F3> :Autoformat<CR><CR>
