set nocompatible
filetype off

" Vundle
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'mitchpaulus/autocorrect.vim'

call vundle#end()

filetype indent plugin on
au! BufRead,BufNewFile *.pen setfiletype pen
set nu
syntax enable 

" set backup
nnoremap Z :w<cr>
set ruler

" Tab Settings
set expandtab
set shiftwidth=4 tabstop=4
set smarttab
set tabstop=4

" Word wrap and display
set wrap
set textwidth=80
set linebreak
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
set mouse=a

" The right way to escape
inoremap jk <Esc>

" Remapping for moving panes in the j-k-h-l directions 
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Press Space to turn off highlighting and clear any displayed message 
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set incsearch 
hi Search ctermbg=yellow ctermfg=black

" Set up clipboard copy and paste
vnoremap <C-c> :w !pbcopy<CR><CR>
vnoremap <C-v> :r !pbpaste<CR><CR>
set ttymouse=xterm2

" Toggle comments 
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <C-m> :call ToggleComment()<cr>
vnoremap <C-m> :call ToggleComment()<cr>
