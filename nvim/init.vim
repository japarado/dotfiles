if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')

	" Completion
	call dein#add('neoclide/coc.nvim', {'rev': 'release'}) 

	" Brackets and Tags
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('alvan/vim-closetag')

	" Syntax Support
	call dein#add('yuezk/vim-js')
	call dein#add('HerringtonDarkholme/yats.vim')
	call dein#add('maxmellon/vim-jsx-pretty')
	call dein#add('rust-lang/rust.vim')
	
	" Themes
	call dein#add('morhetz/gruvbox')
	call dein#add('itchyny/lightline.vim')

	" Utilities
	call dein#add('mattn/emmet-vim')
	call dein#add('junegunn/fzf', { 'build': "fzf#install()" })
	call dein#add('junegunn/fzf.vim')
	call dein#add('francoiscabrol/ranger.vim')
	call dein#add('rbgrouleff/bclose.vim')
	call dein#add('907th/vim-auto-save')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-surround')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-obsession')

	if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/autosave.vim
source ~/.config/nvim/plugins/vim-closetag.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/keybindings.vim

filetype plugin indent on
syntax enable

set number
set termguicolors
set ignorecase
set noshowmode
set nobackup
set nowritebackup
set wildmode=longest:full,full
set mouse=a
set tabstop=2
set shiftwidth=0

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

colorscheme gruvbox

" Gruvbox-specific config
let g:gruvbox_transparent_bg=0
