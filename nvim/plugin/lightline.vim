let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'projectfilepath',  'filename', 
			\ 'modified', 'cocstatus' ] ]
			\ },
			\ 'component_function': {
				\ 'cocstatus': 'coc#status',
				\ 'CurrentFunction': 'CocCurrentFunction',
				\ 'gitbranch': 'FugitiveHead',
				\ 'projectfilepath': 'LightlineFilename'
				\ },
			\ }

function! CocCurrentFunction()
	return get(b:, 'coc_current_function', '')
endfunction

function! LightlineFilename()
	let root = fnamemodify(get(b:, 'git_dir'), ':h')
	let path = expand('%:p')
	if path[:len(root)-1] ==# root
		return path[len(root)+1:]
	endif
	return expand('%')
endfunction

