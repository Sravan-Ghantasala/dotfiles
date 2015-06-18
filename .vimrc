"================================================================================================
"My Changes
"================================================================================================

"Automatically load the changes 
autocmd! bufwritepost .vimrc source %

"Pathogen on
"Personal Settings.
"More to be added soon.
filetype on
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on
syntax on

" Style Me!
" Colors Colors more Colors
colo desert
" set gfn=Terminal:h14:cOEM
" set gfn=Source_Code_Pro_Medium:h14:cANSI
set gfn=Monaco\ 11

" My Status
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [Line=%l\ OF\ %L\ Lines,\ Column=%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_right_sep = '<<'
let g:airline_lef_sep = '>>'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
"let g:airline_left_sep = '>'
"set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set hlsearch
set smartcase
set showmatch
set autoindent
set copyindent
set smarttab
set ruler
set vb
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set bs=2
set pastetoggle=<F4>
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
noremap <C-H> :nohl<CR>
inoremap <C-H> :nohl<CR>
vnoremap <C-H> :nohl<CR>

" Save me!
noremap <C-s> :w<CR>
inoremap <C-s> <C-C> :w<CR>
vnoremap <C-s> <C-C> :w<CR>

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
    " move to beginning/end of line
nnoremap B ^ 
nnoremap E $

    " $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

"=======================================================
" Now lets make this a full blown  IDE
"=======================================================

" ctrlp settings
let g:ctrlp_max_height = 30
set wildignore=*.pyc

" Jedi-Vim
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = "<leader>g"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<c-space>"
let g:jedi#rename_command = "<leader>r"


" python-mode settings
" Disable rope as it is irritating.
let g:pymode = 0
let g:pymode_rope = 1
let g:pymode_rope_project_root = "D:/ropeProjects"
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
let g:pymode_lint_on_fly = 1
let g:pymode_lint_on_write = 0
let g:pymode_options_max_line_length = 200
let g:pymode_lint_config = "D:/Accurev_Streams/FVT_GSK_Floating_TM/Tools/PrePromote/pylintrc"
let g:pymode_lint_ignore = "E501"
map <Leader>b Oimport ipdb; ipdb.set_trace() #BREAKPOINT<C-c>

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

" Cover me
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

nnoremap <leader>s :/<c-r>=expand('<cword>')<cr>/<CR>
nnoremap <Leader>S :%s/<c-r>=expand('<cword>')<cr>//<left><left>

" remove \r crap added by windows at the end
noremap <C-N> :%s/\r//g<CR>
se nosol
" Plant a tree .. Errr NERD one please!
inoremap <F3> <Esc>:NERDTree<CR>
nnoremap <F3> <Esc>:NERDTree<CR>

" Move windows!
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <C-left> : tabprevious<CR>
nnoremap <C-right> : tabnext<CR>

" Make this folded
set foldmethod=indent
set foldlevel=99

" Correct me Please!
" source $VIM/.mySpellings.vim

" My details for snipmate!
let g:snips_author = "Sravan K Ghantasala"
let g:snips_author_abb = "GSK"

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" MRU
inoremap <F1> <Esc>:MRU<CR>
nnoremap <F1> <Esc>:MRU<CR>

" Hex me
" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

  
" TODO list ? Oh Please!
command! Todo noautocmd vimgrep /.*TODO.*GSK/j **/*.py  | cw

" TOASK List Please!
command! Toask noautocmd vimgrep /TOASK/j **/*.py | cw


" Nooooo, Undo this
" Gundo tools :) Life saver
nnoremap <F5> :GundoToggle<CR>

inoremap <C-U> <Esc>:u<CR>
nnoremap <C-U> :u<CR>
"redo is already <C-R>

" Ctrl + tab for new Tab
nnoremap <Leader><Tab> :tabnew <CR>

" Ignore the rest of the world!
set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg
let NERDTreeIgnore=['\.pyc$', '\~$']


" Mark it down [markdown related setttings]
autocmd BufNewFile,BufRead *.md set filetype=markdown

" ease running the last command, [count] times (default: once)
function! RepeatCommandLine(n)
    for i in range(a:n)
        @:
    endfor
endfunction
nnoremap . :<C-U>call RepeatCommandLine(v:count1)<CR>


" JSON formatting
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" Supertab
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" A wrap Please!
set nowrap
autocmd FileType markdown set wrap
autocmd FileType markdown set wrapmargin=80
