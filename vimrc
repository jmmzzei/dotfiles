so ~/.dotfiles/vim/plugins.vim

" Leader
let mapleader = " "
nnoremap <Space> <NOP>

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 22

" coc-explorer
nnoremap <silent> _ :CocCommand explorer<CR>

" change active pane
map <s-q> <C-W>h
map <s-w> <C-W>w

" escape insert mode quickly
imap jj <Esc>
imap kk <Esc>

" always paste the final yanked text
nnoremap <leader>p "0p
vnoremap <leader>p "0p

" clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

colorscheme gruvbox

" delete tildes in blank lines
hi EndOfBuffer ctermfg=235 ctermbg=235
hi SignColumn ctermbg=235
hi ColorColumn ctermbg=0
hi ExtraWhitespace ctermbg=235
hi Comment cterm=italic
" change diff colors
hi DiffAdd ctermbg=236 ctermfg=142 cterm=NONE
hi DiffDelete ctermfg=167 ctermbg=NONE cterm=NONE
hi DiffText cterm=NONE ctermbg=238
hi DiffChange cterm=NONE ctermbg=238 ctermfg=108


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

set ttimeoutlen=10
set redrawtime=10000 
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt=menuone,longest
set cursorline
set ignorecase
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set mouse=a
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set number relativenumber
set numberwidth=5
set regexpengine=0
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
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmode=full
set updatetime=300
set signcolumn=yes

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" more convenient way to save and exit
command WQ wq
command Wq wq
command W w
command Q q

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
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
nnoremap <space>gs :vertical Git<CR>
nnoremap <space>gc :Git commit -v -q<CR>
nnoremap <space>gn :Git commit -v --amend --no-edit<CR><CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gh :Gclog %<CR>
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
cnoreabbrev blame Git blame

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

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

let g:indentLine_char = '▏'
let g:indentLine_fileType = ['python', 'javascriptreact', 'html']

" Prettier configurations
nmap <Leader>f <Plug>(Prettier)
let g:prettier#config#tab_width = '2'
let g:prettier#config#trailing_comma = 'all' 
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true' 
" force vim-prettier to be async
let g:prettier#exec_cmd_async = 1
" disable errors display in the quickfix
let g:prettier#quickfix_enabled = 0
" run before saving
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" autoformat even if a .prettierrc file doesn't exist in the current directory
let g:prettier#autoformat_config_present = 0
" for autoformating only when you have config file in directory or parent.
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0

" set spell for git commit message
autocmd FileType gitcommit setlocal spell

" redefine emmet trigger
let g:user_emmet_leader_key='€'

" set the gitgutter signs bg to the same theme's bg color
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
    \   ['start', 'end'],
    \   ['min', 'max'],
    \   ['desktop', 'mobile', 'tablet'],
    \   ['absolute', 'relative', 'fixed'],
    \   ['blue', 'red', 'green'],
    \   ['0', '1'],
    \   ['ASC', 'DESC'],
    \   ['center', 'space-between'],
    \   ['get', 'set'],
    \   ['request', 'response'],
    \   ['params', 'query'],
    \   ['Request', 'Response'],
    \   ['pick', 'squash', 'edit'],
    \ ]

" Jump between hgunks
" git next
nmap +c <Plug>(GitGutterNextHunk)
" git previous
nmap +C <Plug>(GitGutterPrevHunk)

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
        \ 'V' : 'VL',
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

" Search for the word under the cursor at project level
nnoremap <leader>s :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Use <C-l> for trigger snippet expand.
imap <C-k> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_snippet_next = '<c-k>'
let g:coc_snippet_prev = '<c-j>'

" add a new line when <CR> is pressed and the cursor is between two coc-pairs
" allowed characters
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
