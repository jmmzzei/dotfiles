" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
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
Plug 'sheerun/vim-polyglot'

Plug 'chrisbra/csv.vim'
Plug 'stephpy/vim-yaml'

Plug 'tpope/vim-git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'Yggdroot/indentLine'

Plug 'editorconfig/editorconfig-vim'
Plug 'vimwiki/vimwiki'

call plug#end()
