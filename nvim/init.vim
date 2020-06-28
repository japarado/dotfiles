if &compatible
	set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#add('Shougo/deoplete.nvim')

	" Syntax Support
	call dein#add('jwalton512/vim-blade', { 'on_ft': 'blade' })
	call dein#add('StanAngeloff/php.vim', { 'on_ft': 'php' })
	call dein#add('HerringtonDarkholme/yats.vim', { 'on_ft': 'typescript' })
	call dein#add('yuezk/vim-js', { 'on_ft': ['javascript', 'php', 'blade'] })
	call dein#add('maxmellon/vim-jsx-pretty', { 'on_ft': 'javascript' })
	call dein#add('cakebaker/scss-syntax.vim', { 'on_ft': ['sass','scss'] })
	call dein#add('rust-lang/rust.vim', { 'on_ft': 'rust' })

	" Syntax Utilities
	call dein#add('ap/vim-css-color', {'on_ft': ['css']})
	" call dein#add('shmargum/vim-sass-colors', { 'on_ft': ['sass','scss'] })
	call dein#add('captbaritone/better-indent-support-for-php-with-html', { 'on_ft': 'php' })
	call dein#add('https://github.com/mattn/emmet-vim', { 'on_ft': ['html', 'php', 'blade',  'javascript', 'javascriptreact', 'typescriptreact'] })
	call dein#add('euclio/vim-markdown-composer', { 'build': 'cargo build --release' })
	call dein#add('stephpy/vim-php-cs-fixer', { 'on_ft': 'php' })

	" Themes
	call dein#add('sjl/badwolf')
	call dein#add('gruvbox-community/gruvbox')
	call dein#add('micke/vim-hybrid')
	" call dein#add('jaredgorski/SpaceCamp')

	" Status lines
	" call dein#add('vim-airline/vim-airline')
	" call dein#add('vim-airline/vim-airline-themes')
	call dein#add('itchyny/lightline.vim')
	" call dein#add('maximbaz/lightline-ale')
	
	" Autocomplete and Syntax Checking
	" call dein#add('neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile' })
	call dein#add('neoclide/coc.nvim', { 'rev': 'release' })
	" call dein#add('dense-analysis/ale')

	" Utilities
	call dein#add('tpope/vim-surround')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('alvan/vim-closetag')
	call dein#add('Yggdroot/indentline')
	call dein#add('jiangmiao/auto-pairs')
	call dein#add('907th/vim-auto-save')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('majutsushi/tagbar')	
	call dein#add('francoiscabrol/ranger.vim')	
	call dein#add('junegunn/fzf.vim')
	" call dein#add('camspiers/lens.vim')
	call dein#add('rbgrouleff/bclose.vim')

	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	

	call dein#end()
	call dein#save_state()
endif

" source ~/.config/nvim/plugin/ale.vim
source ~/.config/nvim/plugin/coc.vim
source ~/.config/nvim/plugin/closetag.vim
source ~/.config/nvim/plugin/tagbar.vim
source ~/.config/nvim/plugin/vim-javascript.vim
" source ~/.config/nvim/plugin/airline.vim
source ~/.config/nvim/plugin/ranger.vim
source ~/.config/nvim/plugin/php-cs-fixer.vim
source ~/.config/nvim/plugin/lightline.vim

filetype plugin indent on
syntax enable

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

set ignorecase
set smartcase
set smarttab
set autoindent
" set smartindent
set number
set cursorline
set wildmenu
set autoread
set termguicolors
set hidden
set nobackup
set nowritebackup
set wildmode=longest:full,full
" set wildmode=longest,list
set mouse=a
set cmdheight=2
set shortmess+=c
set signcolumn=yes
set shell=/bin/zsh
set updatetime=300
set tabstop=4
set shiftwidth=4
set noexpandtab
set noswapfile

" Shortcuts
map <C-p> :Files <CR>
map <Leader>t  :tabnew <CR>
map <F5> :e! <CR>

" Set yanking and pasting to clipboard
vnoremap y "*y
vnoremap p "*p


let g:auto_save = 1
" let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1

" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \ }
