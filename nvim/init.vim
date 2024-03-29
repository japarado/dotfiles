if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  " call dein#add('Shougo/deoplete.nvim')

	if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

	" ================================= PLUGIN ZONE ==========================

	" Completion
	call dein#add('neoclide/coc.nvim', {'rev': 'release'}) 

	" Brackets and Tags
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('alvan/vim-closetag')

	" Syntax Support
	call dein#add('nvim-treesitter/nvim-treesitter', { 'hook_post_update': 'TSUpdate' })
	
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

	" ================================= PLUGIN ZONE ==========================

  call dein#end()
  call dein#save_state()
endif

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/autosave.vim
source ~/.config/nvim/plugins/vim-closetag.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/keybindings.vim

filetype plugin indent on
syntax enable

set autoindent
set smartindent
set number
set termguicolors
set ignorecase
set smartcase
set noshowmode
set nobackup
set nowritebackup
set wildmode=longest:full,full
set mouse=a
set tabstop=2
set shiftwidth=0

let g:python2_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python"

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

colorscheme gruvbox

" Gruvbox-specific config
let g:gruvbox_transparent_bg=0

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
