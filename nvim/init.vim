"======================================================================== Compatibility ===================================================
scriptencoding utf-8

if !has('nvim')
    " Sets Neovim defaults in Vim.
    set autoindent
    set autoread " Reload file if external changes are detected.
    set backspace=indent,eol,start
    set belloff=all
    set complete-=i
    set display=lastline
    set formatoptions=tcqj
    set history=10000
    set hlsearch
    set incsearch
    set nolangremap
    set laststatus=2
    set nocompatible
    set ruler
    set sessionoptions-=options
    set showcmd
    set smarttab
    set tabpagemax=50
    set ttyfast
    set undodir=.local/share/vim/undo
    set viminfo+=!
    set wildmenu
else 
    " Set Neovim specific configuration
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"======================================================================== Plugins =========================================================

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox' " gruvbox colorscheme
Plug 'altercation/vim-colors-solarized' " gruvbox colorscheme
Plug 'haishanh/night-owl.vim'

" Thank you Tim Pope!
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist' " Per project vim settings.
" Plug 'tpope/vim-rsi' " Readline style keybindings in insert mode.
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

" if has('nvim') && has('python3')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " code completion
"     Plug 'zchee/deoplete-jedi' " code completion for Python
" endif

Plug 'kien/ctrlp.vim' " Ctrl+P to search for files or tags
Plug 'tpope/vim-fugitive' " improved git commands in vim

Plug 'majutsushi/tagbar' " shows tags in current file
Plug 'chrisbra/improvedft' " multiline jumping with f/t, etc.
Plug 'vim-scripts/ebnf.vim' " syntax highlighting for EBNF
Plug 'mboughaba/i3config.vim'
Plug 'aouelete/sway-vim-syntax'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

Plug 'sgur/vim-editorconfig' " Load editor-independent project settings.

Plug 'justinmk/vim-sneak' " Jump everywhere with s<Two-letters>
" vim view management
Plug 'zhimsel/vim-stay' " preserve views across sessions
Plug '907th/vim-auto-save'
" Plug 'Konfekt/FastFold' " only recompute folds if necessary
Plug 'tmhedberg/SimpylFold'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Python
Plug 'tweekmonster/braceless.vim' " indenting, folding, highlighting, etc. for indentation based languages
Plug 'vim-scripts/indentpython.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'honza/vim-snippets'
call plug#end()

"======================================================================== Colorscheme =====================================================

if (has('termguicolors'))
    set termguicolors
endif

set bg=dark
colorscheme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1

"======================================================================== Editor ==========================================================

filetype plugin indent on
syntax enable

" set encoding=utf-8

set mouse=a " Enable mouse support
set nrformats=alpha,bin,hex
set lazyredraw

" set number

" searching
set ignorecase
set smartcase

set matchpairs+=<:>

" indenting
set tabstop=4
set shiftwidth=4
set expandtab

" wrapping
set nowrap " Don't wrap lines by default.
if exists('+linebreak')
    set linebreak
    set breakindent
    set showbreak=…
endif

if exists('+undofile')
    set undofile " Persist the undo history.
endif

if exists('+virtualedit')
    set virtualedit=block " Allow cursor to move where there is no character, when in block mode.
endif

if exists('+inccommand')
    set inccommand=split " Preview result of command while typing it.
endif

" Undo files
set undofile
set undolevels=1000

set autowrite

let g:auto_save=1 " Activate vim-auto-save plugin
let g:auto_save_silent=1 " Activate vim-auto-save plugin

"======================================================================== Autocommands ====================================================

autocmd FileType haml,yaml,coffee,python BracelessEnable +indent +fold

autocmd BufRead,BufNewFile *.ebnf set filetype=ebnf

" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWrite * mkview
"   autocmd BufRead * silent! loadview
" augroup END

"======================================================================== Spell checking ==================================================
" set spell
set spelllang=en_us,de_20

"======================================================================== Leader Mappings =================================================

let g:mapleader=' '

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q ZZ<CR>
nnoremap <Leader>Q ZQ<CR>
nnoremap <Leader>gc :w<CR>:so $MYVIMRC<CR>
nnoremap <Leader>gp :so $MYVIMRC<CR>:PlugUpdate<CR>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

nnoremap <Leader>gt :TagbarToggle<CR>

" Copy/Paste from system clipboard
nnoremap <silent> <Leader>y "+y
nnoremap <silent> <Leader>Y "+Y
nnoremap <silent> <Leader>x "+x
nnoremap <silent> <Leader>X "+X
nnoremap <silent> <Leader>d "+d
nnoremap <silent> <Leader>D "+D
nnoremap <silent> <Leader>p "+p
nnoremap <silent> <Leader>P "+P

" Copy/Paste from system clipboard (visual mode)
xnoremap <silent> <Leader>y "+y
xnoremap <silent> <Leader>Y "+Y
xnoremap <silent> <Leader>x "+x
xnoremap <silent> <Leader>X "+X
xnoremap <silent> <Leader>d "+d
xnoremap <silent> <Leader>D "+D
xnoremap <silent> <Leader>p "+p
xnoremap <silent> <Leader>P "+P

" Run make
nnoremap <Leader>m :make<CR>

" Toggle folds
nnoremap <silent> <Leader><Leader> za

" Toggle spell checking
nnoremap <silent> <Leader>s :set spell!<CR>

" Toggle numbers
nnoremap <silent> <Leader>n :set number!<CR>

"======================================================================== Other Mappings ==================================================

nnoremap <C-l>  :noh<CR><C-l>
nnoremap <CR> :

" Map some commands on the German keyboards layouts to their original places.
" Use remappable bindings to allow plugins like improvedft to work.
nmap ö ;
omap ö ;
xmap ö ;
nmap Ö ,
omap Ö ,
xmap Ö ,
nmap ä '
omap ä '
xmap ä '
nmap Ä \"
omap Ä \"
xmap Ä \"
nmap gö g;
omap gö g;
xmap gö g;
nmap gÖ g,
omap gÖ g,
xmap gÖ g,
nmap - /
omap - /
xmap - /
nmap _ ?
omap _ ?
xmap _ ?
nmap ü [
omap ü [
xmap ü [
nmap + ]
omap + ]
xmap + ]
nmap Ü {
omap Ü {
xmap Ü {
nmap * }
omap * }
xmap * }

" nmap ö <Plug>SneakNext
" nmap Ö <Plug>SneakPrevious

" let g:sneak#s_next = 1 " Does not work, why?

" nmap f <Plug>Sneak_f
" nmap F <Plug>Sneak_F
" nmap t <Plug>Sneak_t
" nmap T <Plug>Sneak_T

" Shortcut for change to last buffer
nnoremap ^ <C-^>
nnoremap 0 ^

" Make Y behave like D, C, etc.
nnoremap Y y$

"======================================================================== Command Mappings ================================================
cnoremap w!! w !sudo tee > /dev/null %<CR>

"======================================================================== Bugfixes ======================================================== 
" show tmux/terminal background (can't be set in Colorscheme section)
hi Normal guibg=NONE ctermbg=NONE

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
