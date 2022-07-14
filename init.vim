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

Plug 'metakirby5/codi.vim'
Plug 'prettier/vim-prettier'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

Plug 'yardnsm/vim-import-cost', { 'do': 'npm install --production' }

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


let mapleader=' '
let maplocalleader=' '

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
map <leader>e :NERDTreeToggle<CR>


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
nmap L :bnext<CR>
nmap H :bprevious<CR>
nmap <leader>bn :new<CR>:q<CR>
nmap <leader>bq :bd<CR>

" Moving lines 
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

let NERDTreeShowHidden=1

let g:prettier#exec_cmd_path = "/opt/homebrew/bin/prettier"
let g:prettier#quickfix_enabled = 0

autocmd BufWrite *.vue,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.svelte,*.yaml,*.html PrettierAsync

let g:php_cs_fixer_cache = "/Users/nopfault/git/teensyUrl/.php-cs-fixer.cache"
let g:php_cs_fixer_config_file = "/Users/nopfault/git/teensUrl/.php-cs-fixer.php"

let g:php_cs_fixer_rules = "@PSR2"
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

" since it is fullscreen, I'd like a 50/50 split
let g:codi#width = winwidth(winnr()) / 2
let g:codi#interpreters = {
            \ 'python': {
                \ 'bin': 'python3',
                \ 'prompt': '^\(>>>\|\.\.\.\) ',
                \ },
                \ }

 " Telescope FzF keys
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {".git", "node_modules", "vendor" },
    }
}
EOF


" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" GitGutter
"

let g:gitgutter_enabled = 1

if executable('git')
    "let g:gitgutter_highlight_lines = 1  " Turn on gitgutter highlighting
else
    let g:gitgutter_git_executable = '/bin/true'
    let g:gitgutter_enabled = 0
endif


function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}


augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END
