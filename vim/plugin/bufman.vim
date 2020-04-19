" bufman: the simplest vim buffer manager
" version: 0.1
" last change: 18 April 2020
" author: Maxime Rousseau
"
" file opening
" ;o -> display files directories
" number assigned to each, enter the letter
" if a file open it
" if a directory, refreshes list list again

" verify if already loaded
if exists("g:loaded_bufman")
	finish
endif
let g:loaded_bufman = 1

function! s:MakeSublist()
	let nested = 0
	let full_list = systemlist('ls -A')
	let opt_list = []
	let index = 0
	let slash = []

	if len(full_list) <= 10
		let opt_list += [full_list]
	else
		while index < len(full_list)


			if (index + 1) % 10 == 0
				let slash += [index]

					if len(full_list[index:]) > 10
						let tmp_list = full_list[index-9: index]
						let opt_list += [tmp_list]
					else
						let tmp_list = full_list[index-9: index]
						let opt_list += [tmp_list]
						let tmp_list = full_list[index+1:]
						let opt_list += [tmp_list]
					endif

			endif
			let index += 1
		endwhile
		let nested = len(slash)
	endif

	return [nested, opt_list]
endfunction

" will display ten file names
function! s:DisplayList(slice_list)
	let disp_list = a:slice_list
	let index = 0
	while index < len(disp_list)
		echo join([string(index),'>', disp_list[index]])
		let index += 1
	endwhile
endfunction

let ret = s:MakeSublist()
let s:list_count = ret[0]
let s:opt_list = ret[1]
let s:i =  0
let s:msg = "Input number to open, TAB to cycle file list, any key to exit"

function! s:Open()
	redraw!
	call s:DisplayList(s:opt_list[s:i])
	echo s:msg
	let selection = getchar()

	if selection == 9
		if s:i == (s:list_count)
			let s:i = 0
		else
			let s:i += 1
		endif
		call s:Open()
	elseif selection < 58 && selection > 47
			let selection -= 48
			execute 'e ' . fnameescape(s:opt_list[s:i][selection])
	else
			redraw!
	endif

endfunction

" default keymapping
if !hasmapto('<Plug>BufmanOpen')
	map <unique> <Leader>o <Plug>BufmanOpen
endif

" function call
noremap <unique> <script> <Plug>BufmanOpen <SID>Open
noremap <SID>Open :call <SID>Open()<CR>

" command
if !exists(':Bopen')
	command Bopen :call s:Open()
endif
