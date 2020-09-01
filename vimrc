" Leader
let mapleader = " "
nnoremap <Space> <NOP>

" netrw
nnoremap _ :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 22

" move lines
nnoremap <A-k> :m .+1<CR>==
nnoremap <A-l> :m .-2<CR>==
inoremap <A-k> <Esc>:m .+1<CR>==gi
inoremap <A-l> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '>+1<CR>gv=gv
vnoremap <A-e release branch (recommend)> :m '<-2<CR>gv=gv

" change active pane
map <s-q> <C-W>h
map <s-w> <C-W>w

" escape insert mode quickly
imap jj <Esc>
imap kk <Esc>

" copy from current position to the end of the line
:map Y y$

" insert a new line in normal mode
nnoremap  <CR>  i<CR><esc>

" insert a space in normal mode
" nnoremap <space><space> i<space><esc>

" change vim navigations keys for my keyboard
nnoremap ñ l
nnoremap l k
nnoremap k j
nnoremap j h

onoremap ñ l
onoremap l k
onoremap k j
onoremap j h

vnoremap ñ l
vnoremap l k
vnoremap k j
vnoremap j h

" save on buffer leaves or vim's focus is lost
autocmd BufLeave,FocusLost * silent! wall

" toggle backward cursor and record macro key
nnoremap q b
nnoremap b q
xnoremap q b
xnoremap b q
onoremap q b
onoremap b q

set redrawtime=10000 
set fillchars+=vert:│
set backspace=2   " Backspace deletes like most programs in insert mode
" Some servers have issues with backup files
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp//,.
set clipboard=unnamedplus
set completeopt=menuone,longest
set cryptmethod=blowfish2
set cursorline
set directory=/tmp//,.
set encoding=utf-8
set smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set numberwidth=5
set regexpengine=1
set scrolloff=2
set showmatch
set noshowmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set textwidth=0
set ttimeout
set ttyfast
set ttymouse=sgr
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap
set updatetime=300
set bg=dark
set signcolumn=yes

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation.
set nojoinspaces

" https://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow/2460593#2460593
set complete-=i

" Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" more convenient way to save and exit
command WQ wq
command Wq wq
command W w
command Q q

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" perform a ripgrep search
nnoremap <leader>e :Rg<CR>

" fzf key bindings
nnoremap <space>gk :Commits<CR>

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :vertical Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gn :Gcommit -v --amend --no-edit<CR><CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gh :0Glog<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/jsonc.vim'
" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'
" Better manage Vim sessions.
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
" Helpers for moving and manipulating files / directories.
Plug 'tpope/vim-eunuch'
" Toggle comments in various ways.
Plug 'tpope/vim-commentary'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'
" A number of useful motions for the quickfix list, pasting and more.
Plug 'tpope/vim-unimpaired'
Plug 'machakann/vim-sandwich'
Plug 'itchyny/lightline.vim'

" Zoom in and out of a specific split pane (similar to tmux).
Plug 'dhruvasagar/vim-zoom'

Plug 'AndrewRadev/switch.vim'

" Pass focus events from tmux to Vim (useful for autoread and linting tools).
Plug 'tmux-plugins/vim-tmux-focus-events'

" Launch Ranger from Vim.
" Plug 'francoiscabrol/ranger.vim'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'

" Run a diff on 2 blocks of text.
Plug 'AndrewRadev/linediff.vim'

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'

" Better display unwanted whitespace.
Plug 'ntpeters/vim-better-whitespace'

" Drastically improve insert mode performance in files with folds.
Plug 'Konfekt/FastFold'

" Automatically show Vim's complete menu while typing.
" Plug 'vim-scripts/AutoComplPop'

" Run test suites for various languages.
Plug 'janko/vim-test'

" Languages and file types.

" Plug 'tmux-plugins/vim-tmux'

Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'


Plug 'tpope/vim-git'
Plug 'vim-python/python-syntax'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

nmap <Leader>f <Plug>(Prettier)
let g:prettier#config#tab_width = '2'
let g:prettier#config#trailing_comma = 'all' 
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true' 

" force vim-prettier to be async
let g:prettier#exec_cmd_async = 1

" disable errors display in the quickfix
let g:prettier#quickfix_enabled = 0

" autoformat even if a .prettierrc file doesn't exist in the current directory
let g:prettier#autoformat_config_present = 0

" run before saving
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" for autoformating only when you have config file in directory or parent.
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0


" redefine emmet trigger
let g:user_emmet_leader_key='€'

" set the gitgutter signs bg to the same bg color of the theme
let g:gitgutter_override_sign_column_highlight = 1

" change some gitgutter signs
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

let g:switch_custom_definitions =
    \ [
    \   ['block', 'none'],
    \   ['row', 'column'],
    \   ['left', 'right'],
    \   ['padding', 'margin'], 
    \   ['height', 'width'],
    \   ['vw', 'vh'],
    \   ['top', 'bottom'],
    \   ['primary', 'secondary'],
    \   ['0', '1'],
    \   ['center', 'space-between'],
    \   ['get', 'set'],
    \   ['request', 'response'],
    \   ['params', 'query'],
    \   ['Request', 'Response'],
    \   ['pick', 'squash', 'edit'],
    \ ]


" vim-unimpaired alternatives for my non-US keyboard
nmap ¿ [
nmap + ]
omap ¿ [
omap + ]
xmap ¿ [
xmap + ]

" Jump between hgunks
" git next
nmap +c <Plug>(GitGutterNextHunk)  
" git previous
nmap >¿c <Plug>(GitGutterPrevHunk)  

colorscheme gruvbox

" delete tildes in blank lines
hi EndOfBuffer ctermfg=235 ctermbg=235
hi SignColumn ctermbg=235
hi ColorColumn ctermbg=0
hi ExtraWhitespace ctermbg=235

hi Comment cterm=italic

" change diff colors
hi DiffAdd ctermbg=235 ctermfg=142 cterm=NONE
hi DiffDelete ctermfg=167 ctermbg=235 cterm=NONE
hi DiffText cterm=NONE ctermbg=236
hi DiffChange cterm=NONE ctermbg=236 ctermfg=108

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [
      \            [ 'percent' ],
      \            [ 'filetype' ] ] },
      \ 'inactive': {
      \   'left':[['relativepath']],
      \   'right':[],
      \  },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'V ',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'S ',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }

" toggle comments
nmap ; gcc
vmap ; gc

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" treat visual lines as real lines when a long line wrap occurs
noremap <silent> l gk
noremap <silent> k gj
noremap <silent> 0 g0
noremap <silent> $ g$

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

inoremap <c-j> <Nop>
inoremap <c-k> <Nop>

let g:coc_snippet_next = '<c-k>'
let g:coc_snippet_prev = '<c-j>'

" Search for the word under the cursor at project level
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
