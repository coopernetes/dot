" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if !isdirectory($HOME."/.vim")
  call mkdir($HOME."/.vim", "", 0770)
endif


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  let undo_path=$HOME."/.vim/backups"
  if !isdirectory($HOME."/.vim/backups")
    call mkdir($HOME."/.vim/backups", "", 0770)
  endif
  set backupdir=$HOME/.vim/backups/
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    let undo_path=$HOME."/.vim/vimundo"
    if !isdirectory($HOME."/.vim/vimundo")
      call mkdir($HOME."/.vim/vimundo", "", 0770)
    endif
    set undodir=$HOME/.vim/vimundo,/tmp//
    set undofile " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
  Plug 'Shougo/deoplete.nvim'
endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'editorconfig/editorconfig-vim'
let g:deoplete#enable_at_startup = 1
call plug#end()

call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

set ruler
set showmode
set wildmenu
set incsearch
set number
set smarttab
set encoding=utf-8

