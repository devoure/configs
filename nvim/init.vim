" Plugins
call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'                  " vim-one color theme
Plug 'scrooloose/nerdtree'           " side bar file tree
Plug 'itchyny/lightline.vim'         " minmal status bar
Plug 'tpope/vim-fugitive'            " allows git commands in vim session
Plug 'airblade/vim-gitgutter'        " shows git changes in gutter
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
Plug 'ncm2/ncm2-bufword'             " complete words in buffer
Plug 'ncm2/ncm2-path'                " complete paths
Plug 'gaalcaras/ncm-R'               " R completion [dep]: ncm2, Nvim-R
Plug 'jalvesaq/Nvim-R'               " required for ncm-R
Plug 'dense-analysis/ale'            " linting [dep]: pip3 install flake8, install.packages('lintr')
Plug 'fisadev/vim-isort'             " Python sort imports [dep]: pip3 install isort
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'            " A start menu for vim
Plug 'tpope/vim-surround'            " replace surrounding characters
Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
Plug 'SirVer/ultisnips'              " hotkeys for chunks of code
Plug 'JuliaEditorSupport/julia-vim'  " julia syntax highlighting
Plug 'tmhedberg/SimpylFold'          " Code folding (zo: open, zc: close)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'              " Fuzzy Finder
Plug 'rust-lang/rust.vim'            " Rust format
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim
"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim
Plug 'SirVer/ultisnips'                             " https://github.com/sirver/UltiSnips
Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
" airline
let g:airline_powerline_fonts = 1
" ncm2-loom
let g:ncm2_look_enabled = 0
" setting font
set guifont=DroidSansMono\ Nerd\ Font\ 11
" turn on spelling and make a spell file
set spelllang=en_us
set spellfile=~/.config/nvim/en.utf-8.add

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" vim-isort 
let g:vim_isort_map = '<C-i>'

" Ale Linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
let g:ale_fixers={'python': ['black']}

" lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ncm2 
autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information
let g:python3_host_prog='/home/athman/anaconda3/bin/python'            " ncm2-jedi


" gitgutter
let g:gitgutter_async=0

" nerdtree sttings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']  " ignore pyc files

" Theme settings
colorscheme one                  " use vim-one colorscheme
set background=dark              " [dark or light]
set termguicolors                " fg and bg highlighting requires compatible terminal colors

" Window Splits
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k
map <Leader>td :new term://bash<CR>isqlite3<CR><C-\><C-n><C-w>k
map <Leader>tj :new term://bash<CR>ijulia<CR><C-\><C-n><C-w>k
map <Leader>ts :new term://bash<CR>iscala<CR><C-\><C-n><C-w>k
" Setting mapping for nerdtree
nmap <F6> :NERDTreeToggle<CR>
" General Settings
set number                      " set line numbers
set updatetime=100              " set update time for gitgutter update
set noswapfile                  " no swap
set clipboard=unnamedplus       " Copy/paste between vim and other programs. '"+y' then middlemouse
" tabs and spaces
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Uses shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=2                " One tab == four spaces.
set tabstop=2                   " One tab == four spaces.<Paste>
" remap
:imap ii <Esc>
" python alias (,p runs python on script. ,t times python script)
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>
" SQLite should use SQL highlights. See :help ft-sql for more info
autocmd BufNewFile,BufRead *.sqlite set syntax=sql
@devoure
