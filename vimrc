so ~/.dotfiles/vim/plugins.vim

" when a zsh terminal is opened, fix the height to 10 and enter insert mode
au TermOpen term:/*/usr/bin/zsh startinsert

" command to open a terminal in a horizontally splitted pane
command! TT :10sp | term

cnoreabbrev Delete Delete!
cnoreabbrev Del Delete!

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

" escape terminal mode quickly
tnoremap kk <C-\><C-n>
tnoremap jj <C-\><C-n>

" escape insert mode quickly
imap jj <Esc>
imap kk <Esc>

" escape insert mode quickly in temrinal mode
tnoremap kk <C-\><C-n>
tnoremap jj <C-\><C-n>

" always paste the final yanked text
nnoremap <leader>p "0p
vnoremap <leader>p "0p

" clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_italic_variables = 1
colorscheme tokyonight

" colorscheme gruvbox

" " delete tildes in blank lines
" hi EndOfBuffer ctermfg=235 ctermbg=235
" hi SignColumn ctermbg=235
" hi ColorColumn ctermbg=0
" hi ExtraWhitespace ctermbg=235
" hi Comment cterm=italic
" " change diff colors
" hi DiffAdd ctermbg=236 ctermfg=142 cterm=NONE
" hi DiffDelete ctermfg=167 ctermbg=NONE cterm=NONE
" hi DiffText cterm=NONE ctermbg=238
" hi DiffChange cterm=NONE ctermbg=238 ctermfg=108

" read javascript and typescript as filetype *react
autocmd FileType typescript set filetype=typescriptreact
autocmd FileType javascript set filetype=javascriptreact

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
set spellsuggest=8
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
" Better display for messages
set cmdheight=1

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
" if, in the future, you want to pass options to the process, use jesseleite/vim-agriculture
nnoremap <leader>e :Rg<CR>

" perform a ripgrep search in visual mode
vnoremap <space>e "jy:Rg <C-R>j<CR>

" fzf key binding: show project's commits
nnoremap <space>gk :Commits<CR>

" fzf key binding: show buffer's commits
nnoremap <space>gj :BCommits<CR>

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
nnoremap <space>gps :Git push<CR>
nnoremap <space>gpl :Git pull<CR>
cnoreabbrev blame Git blame

" vim-test mappings
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <Leader>tg :TestVisit<CR>

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
let g:indentLine_fileType = ['python', 'javascriptreact', 'typescriptreact', 'html', 'hbl']

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
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.jsonc,*.graphql,*.md,*.vue,*.yaml,*.html,*hbs :silent! PrettierAsync

" autoformat even if a .prettierrc file doesn't exist in the current directory
let g:prettier#autoformat_config_present = 0
let g:prettier#autoformat_require_pragma = 0

" for autoformating only when you have config file in directory or parent:
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0

" set spell for git commit message and markdown filetypes
autocmd FileType gitcommit,markdown setlocal spell

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
    \   ['left', 'right'],
    \   ['first', 'last'],
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
    \   ['after', 'before'],
    \   ['0', '1'],
    \   ['ASC', 'DESC'],
    \   ['center', 'space-between'],
    \   ['get', 'set'],
    \   ['col', 'row'],
    \   ['request', 'response'],
    \   ['params', 'query'],
    \   ['Request', 'Response'],
    \   ['pick', 'squash', 'edit'],
    \   ['horizontalAlign', 'verticalAlign'],
    \   ['marginRight', 'marginLeft'],
    \   ['marginTop', 'marginBottom'],
    \   ['paddingRight', 'paddingLeft'],
    \   ['paddingTop', 'paddingBottom'],
    \   ['preventHorizontalStretch', 'preventVerticalStretch'],
    \   ['borderColor', 'borderWidth'],
    \   ['colGap', 'rowGap'],
    \   ['footer', 'header'],
    \   ['anchor', 'button'],
    \   ['visible', 'hidden'],
    \   ['even', 'odd'],
    \   ['textAlignment', 'textPosition'],
    \   ['Increment', 'Decrement'],
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
      \ 'colorscheme': 'tokyonight',
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

" Treat pure javascript and typescript files as jsx/tsx
au BufRead,BufNewFile *.js,*jsx set filetype=javascriptreact
au BufRead,BufNewFile *.ts,*tsx set filetype=typescriptreact

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

" Search for the word under the cursor at project level in visual mode
" vnoremap <space>s "hy:CocSearch <C-R>h<CR>

" Use <C-l> for trigger snippet expand.
" imap <C-k> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_prev = '<c-j>'
let g:coc_snippet_next = '<c-k>'

" add r new line when <CR> is pressed and the cursor is between two coc-pairs
" allowed characters
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Mappings using CoCList:
" Show current buffer diagnostics.
nnoremap <silent> <space>d  :CocDiagnostics 5<CR>

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

" ---------------------- Start autocomplete config ----------------------
" Needed to make the autocomple work. Run :h coc-completion to more info
" Use <tab> and <S-tab> to navigate completion list: >
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <s-TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
"     \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""Use <c-space> to trigger completion: >
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"To make <CR> to confirm selection of selected complete item or notify coc.nvim to format on enter, use: >
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" FOR NOW, I'M NOT USING THIS FEATURE
 " Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode: >
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" ---------------------- End autocomplete config ----------------------

" Disable suggestions of words that are in the same file (around) or in
" other buffers (buffer) to keep the autocomplete list as short and clean as possible.
autocmd FileType * let b:coc_disabled_sources = ['around', 'buffer']

" In some filetypes this option might be useful.
autocmd FileType markdown,json let b:coc_disabled_sources = []

function! IsOnSomeParticularMachine(hostname)
    return match(hostname(), a:hostname) >= 0
endfunction

function GetNotesFolder()
  if IsOnSomeParticularMachine("jmm-pc")
    return "~/Documents/notes"
  else
    return "~/Documentos/notes"
endfunction

let g:vimwiki_list = [{'path': GetNotesFolder(),
                      \ 'syntax': 'markdown', 'ext': '.md'}]

nmap <Leader>ww :100vs \| :VimwikiIndex<CR>

nmap <silent>gvd :call CocAction('jumpDefinition', 'vsplit')<CR>
