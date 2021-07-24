-- ****************************************************************************
-- lua neovim script to setup my dev environment
-- 1. press F5 to start setup (select root directory of project, maybe select
-- previous workspace, select build files and other things...)
-- 2. open all files and have consistent window layout (left side with file
-- explorer + list of project functions/variables/class ctags | 2 windows for
-- source code)
-- 3. easy command mapping (build, debug, run, etc ...)
--
-- Dependency free (or at least for the core functions), pure lua and loaded
-- when needed for development.
-- ****************************************************************************
local api = vim.api

local Dev = {}

-- change directory, open all files in directory, assign path to build
-- file/command "string"
function Dev.setup()
	print("Hello world")

	root_dir = '~/source'
	build_call = 'build.bat'
	-- file_list -- should ignore opening some files
	return 0
end


-- setup windows
function Dev.ui()
	print("ui")
	return 0
end

return Dev.setup()
-- useful commands/binds

