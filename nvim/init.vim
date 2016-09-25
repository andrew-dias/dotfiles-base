" split cache files from configuration
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" set colorscheme to match terminal
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set lightline theme
let g:lightline = {
      \ 'colorscheme': 'base16',
      \ }

" shortcut to toggle 'set list'
nmap <leader>l :set list!<CR>
set list

" symbols for whitespace
set listchars=tab:▸\ ,eol:¬,trail:.

" show line numbers
set number

" set default tab behaviour
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expandtab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction

