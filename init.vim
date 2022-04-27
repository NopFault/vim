" :CocConfig
" {
"  "coc.preferences.formatOnSaveFiletypes": ["py", "yaml", "json"],
"  "python.linting.flake8Enabled": true,
"  "python.formatting.provider": "black"
" }
"
" python3 -m pip install black flake8
"
" :CocInstall
" coc-spell-checker: The general spell checker for neovim
" coc-prettier: A very popular code formatter
" coc-git: A git plugin to show which line is added/deleted and not committed
" coc-pyright: The main Python plugin I use
" coc-json: JSON file formatting plugin
" coc-docker: Dockerfile and docker-compose formatters
" coc-yaml: Yaml plugin for Kubernetes and terraform files
" coc-tabnine
"
"
" All Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'folke/tokyonight.nvim'
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim'
Plug 'metakirby5/codi.vim'
Plug 'prettier/vim-prettier'

call plug#end()

" Basic Settings 
"
syntax on
set notermguicolors
set t_Co=256
set background=dark
set termguicolors


let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

let g:tokyonight_colors = {
            \ 'hint': 'orange',
            \ 'error': '#ff0000'
            \ }

colorscheme tokyonight

set cursorline
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

set display+=lastline
set nostartofline               " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	    " Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).


" toggle hybrid line numbers
set nu rnu
nmap L :set nu! rnu!<CR>


let mapleader=','
let maplocalleader=','

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"if &listchars ==# 'eol:$'
"    set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
"endIf
"let g:python_host_prog="/usr/local/bin/python3"

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" nerdtree config
map <leader>n :NERDTreeToggle<CR>


" airline settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'

" Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-e>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_quit_key='<Esc>'

" Buffer handling
" Ctrl-w o -> makes new split buffer into whole window
"
nmap <leader>l :bnext<CR>
nmap <leader>p :bprevious<CR>
nmap <leader>bn :new<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" Moving lines 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let NERDTreeShowHidden=1

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" Format action on <leader>f
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Goto definition
nmap <silent> gd <Plug>(coc-definition)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

let g:prettier#exec_cmd_path = "/opt/homebrew/bin/prettier"
let g:prettier#quickfix_enabled = 0

autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync


" since it is fullscreen, I'd like a 50/50 split
let g:codi#width = winwidth(winnr()) / 2
let g:codi#interpreters = {
            \ 'python': {
                \ 'bin': 'python3',
                \ 'prompt': '^\(>>>\|\.\.\.\) ',
                \ },
                \ }


