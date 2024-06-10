return {
	{ "isak102/telescope-git-file-history.nvim" },
	{ "vimwiki/vimwiki" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-eunuch" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = have_make and "make"
			or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		enabled = have_make or have_cmake,
		config = function(plugin)
			LazyVim.on_load("telescope.nvim", function()
				local ok, err = pcall(require("telescope").load_extension, "fzf")
				if not ok then
					local lib = plugin.dir .. "/build/libfzf." .. (LazyVim.is_win() and "dll" or "so")
					if not vim.uv.fs_stat(lib) then
						LazyVim.warn("`telescope-fzf-native.nvim` not built. Rebuilding...")
						require("lazy").build({ plugins = { plugin }, show = false }):wait(function()
							LazyVim.info("Rebuilding `telescope-fzf-native.nvim` done.\nPlease restart Neovim.")
						end)
					else
						LazyVim.error("Failed to load `telescope-fzf-native.nvim`:\n" .. err)
					end
				end
			end)
		end,
	},
	{
		"aaronhallaert/advanced-git-search.nvim",
		cmd = { "AdvancedGitSearch" },
		config = function()
			-- optional: setup telescope before loading the extension
			require("telescope").setup({
				-- move this to the place where you call the telescope setup function
				extensions = {
					advanced_git_search = {
						-- Browse command to open commits in browser. Default fugitive GBrowse.
						-- {commit_hash} is the placeholder for the commit hash.
						browse_command = "GBrowse {commit_hash}",
						-- when {commit_hash} is not provided, the commit will be appended to the specified command seperated by a space
						-- browse_command = "GBrowse",
						-- => both will result in calling `:GBrowse commit`

						-- fugitive or diffview
						diff_plugin = "fugitive",
						-- customize git in previewer
						-- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
						git_flags = {},
						-- customize git diff in previewer
						-- e.g. flags such as { "--raw" }
						git_diff_flags = {},
						-- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
						show_builtin_git_pickers = false,
						entry_default_author_or_date = "author", -- one of "author" or "date"
						keymaps = {
							-- following keymaps can be overridden
							toggle_date_author = "<C-w>",
							open_commit_in_browser = "<C-o>",
							copy_commit_hash = "<C-y>",
							show_entire_commit = "<C-e>",
						},

						-- Telescope layout setup
						telescope_theme = {
							function_name_1 = {
								-- Theme options
							},
							function_name_2 = "dropdown",
							-- e.g. realistic example
							show_custom_functions = {
								layout_config = { width = 0.4, height = 0.4 },
							},
						},
					},
				},
			})

			require("telescope").load_extension("advanced_git_search")
		end,
		dependencies = {
			"nvim-telescope/telescope.nvim",
			-- to show diff splits and open commits in browser
			"tpope/vim-fugitive",
			-- to open commits in browser with fugitive
			"tpope/vim-rhubarb",
			-- optional: to replace the diff from fugitive with diffview.nvim
			-- (fugitive is still needed to open in browser)
			-- "sindrets/diffview.nvim",
		},
	},
}
