"================================================================================================
"My Changes
"================================================================================================

"Automatically load the changes 
autocmd! bufwritepost .vimrc source %

"Pathogen on
"Personal Settings.
"More to be added soon.
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

" Style Me!
colorscheme morning

" My Status
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [Line=%l\ OF\ %L\ Lines,\ Column=%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set hlsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set bs=2
set pastetoggle=<F2>
set clipboard=unnamed
set cursorline
set title

" Misc
inoremap jj <Esc> " Esc is so far away without this mapping...
noremap <silent><Leader>? :map <Leader><CR> " Reveal me the key secrets

" Oh! Gimme some space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" No backup! I work alone
set nobackup
set nowritebackup
set noswapfile

"Remap Leader key
let mapleader=","

"Will you stop Highlighting! Damn you
noremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>

" Save me!
noremap <C-Z> :w<CR>
inoremap <C-Z> <C-C> :w<CR>
vnoremap <C-Z> <C-C> :w<CR>

" Get Out!
noremap <Leader>e :q!<CR>
noremap <Leader>E :qa!<CR>

" I like to move it move it!
vnoremap < <gv
vnoremap > >gv
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

" Undo and Redo
"noremap <C-u> :u<CR>
map <C-u> :echo 'undo undone'<cr>
inoremap <C-u> : <C-o>u<cr>
"redo is already <C-R>


"=======================================================
" Now lets make this a full blown  IDE
"=======================================================

" ctrlp settings
let g:ctrlp_max_height = 30
set wildignore=*.pyc

" python-mode settings
" map <Leader>g: call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'sys']
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_goto_definition_bind = '<Leader>g'
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_breakpoint = 1
let g:pymode_syntax = 1
let g:pymode_syntax_buitin_objs = 1
let g:pymode_syntax_builtin_funcs = 1

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

"Python folding
set nofoldenable

nnoremap <leader><CR> :autocmd BufWritePost * call system("ctags -R")<CR>


" auto close the brackets
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>

nnoremap <leader>s :%s//<left>
nnoremap <Leader>S :%s/<c-r>=expand('<cword>')<cr>//c<left><left>

se nosol

nnoremap <F5> :GundoToggle<CR>


