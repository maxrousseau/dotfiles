" bufman
" The simplest vim buffer manager
" Last change: 13 April 2020
"

" file opening
" ;o -> open menu listing files and directory
"	letter assigned to each, enter the letter
"	if a file open it
"	if a directory, refreshes list list again

function! Open()
	let f_string = globpath('.', '*') . globpath('./', '.[^.]*')
	let f_string = system('ls -a')
	let f_list = split(f_string[4:])
	let index = 0

	while index < len(f_list)
		echo join([string(index),'>', f_list[index]])
		let index = index + 1
	endwhile

	call inputsave()
	let selection = input('Open: ')
	call inputrestore()
	let fileopen = join(['edit ', f_list[selection]])
	execute fileopen
endfunction

