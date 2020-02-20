""" Overall Configuration =======================
set tabstop=2           " Configs tab indent width to 2 spaces
set shiftwidth=2        " .. 
set expandtab           " ..

set number       
set relativenumber 
set mouse=a             " Enable mouse interaction for all modes 
"set scrolloff=10
set termguicolors

set inccommand=split    " Highlight regex and show replace alteration before confirm
set clipboard=unnamed   " Share one clipboard for everything
set completeopt=longest,menuone,noselect,preview

set background=dark     " 
set t_Co=256            "  

set updatetime=100      " Configure file updatetime to 100 ms
set autoread            " Automatically update file if changed outside of Vim 
set autowrite           " Automaically save file when swap between opened files

""" Key Bindings ================================
"" My keybindings
let mapleader=","
nnoremap <leader>q  :q<cr>          " Close file
nnoremap <leader>w  :w<cr>          " Write file (save)
nnoremap <Leader>x  :x<CR>          " Write and close file
nnoremap <Leader>n  :next<CR>       " Next file on Buffer
nnoremap <leader>p  :prev<CR>       " Previous file on Buffer

nnoremap <c-h>      :noh<cr>        " Clean highlights
inoremap <c-a>      <c-o>0          " Go to begin of line ( insert mode )
inoremap <c-e>      <c-o>$          " Go to end of line ( insert mode )
inoremap <c-z>      <c-o>u          " Undo ( insert mode )
nnoremap <cr><cr>   m`o<esc>``      " Insert newline below, but keeps on cursor on place

nnoremap Q          :qall<CR>       " Close all files

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

"" reMapping things
map n nzz                 " Center line during search navigation
map N Nzz                 " ..
nnoremap <up>   g<up> 	  " Navigate up/down through multine line
nnoremap <down> g<down>   " ..

"" Plugins Bindings
map <leader>vp  :VimuxPromptCommand<cr>
map <leader>vl  :VimuxRunLastCommand<cr>
map <Leader>wr  :w \| VimuxRunLastCommand<CR>

" Toggle eRegex plugin
nnoremap <leader>/ :call eregex#toggle()<CR>

" FZF keybindings
nnoremap <c-b>  :Buffers<cr>  " Navigate through buffer files
nnoremap <c-p>  :Files<cr>    " Search for file through folder 
nnoremap <c-f>  :Rg<space>    " Search for string inside files through folder

" <CR> confirm and close selection menu ( eg. autocompletion menu )
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" more key mappings at end of file

""" Auto Commands ===============================
" Create highlight over current line
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter * hi cursorline gui=bold guifg=none guibg=#404747
    au WinLeave * setlocal nocursorline
augroup END

augroup PMenu
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * hi Pmenu guibg=#404040 guifg=white
augroup END

" Move file when cursor reach 1/3 from window borders
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END

""" Plugin Management ===========================
call plug#begin()

"" Plugins Installation ---------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tyok/nerdtree-ack'
Plug 'ivalkeen/nerdtree-execute'
Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'severin-lemaignan/vim-minimap'
Plug 'wellle/tmux-complete.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'roxma/vim-paste-easy'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'othree/eregex.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/matchit.zip'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
"Plug 'ervandew/supertab'
Plug 'kana/vim-arpeggio'
Plug 'lambdalisue/vim-manpager'
Plug 'vifm/vifm.vim'
Plug 'liuchengxu/vim-clap'
Plug 'ncm2/float-preview'
Plug 'chrisbra/Colorizer'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'rbong/vim-flog'

"" Themes -----------------------------
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', { 'rtp': '/vim' }
Plug 'flrnprz/candid.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'connorholyday/vim-snazzy'
Plug 'kaicataldo/material.vim'

call plug#end()

""" Themes Configuration ========================
colorscheme candid
let g:airline_theme='onehalfdark'

""" Plugins Configuration =======================

"" Ack.vim ----------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" Airline ----------------------------
" Turn on Powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"" ALE --------------------------------
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

"" Arpeggio Mappings ------------------
call arpeggio#map('n','',0,'sv',':vsplit<CR>')
call arpeggio#map('n','',0,'sh',':split<CR>')
call arpeggio#map('i','',0,'jo','<C-o>o')
call arpeggio#map('i','',0,'ko','<C-o>O')

"" Blamer -----------------------------
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_prefix = ' ❱ '

"" Coc --------------------------------
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"" eRegex -----------------------------
let g:eregex_default_enable = 0

"" FZF --------------------------------
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

"" indentLine -------------------------
let g:indentLine_char = '▏'

"" NerdTREE ---------------------------
" Mappings
map <leader>' :NERDTreeToggle<CR>
" NERDTree Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" SuperTAB ---------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"

"" Vim Tmux Navigation ----------------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\>     :TmuxNavigatePrevious<cr>


filetype plugin on
filetype indent on

""" Functions ===================================

"" My functions -----------------------
" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

