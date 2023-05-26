-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("machakann/vim-sandwich")

	use("airblade/vim-gitgutter")

	use("haya14busa/is.vim")

	use("tpope/vim-fugitive")

	use("tpope/vim-unimpaired")

	use("tpope/vim-eunuch")

	use("tpope/vim-commentary")

	use("sheerun/vim-polyglot")

	use("junegunn/goyo.vim")

	use("editorconfig/editorconfig-vim")

	use("vimwiki/vimwiki")

	use("Yggdroot/indentLine")

	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("jose-elias-alvarez/null-ls.nvim")

	use("jay-babu/mason-null-ls.nvim")

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				action_keys = { -- key mappings for actions in the trouble list
					-- map to {} to remove a mapping, for example:
					-- close = {},
					previous = "l", -- previous item
					next = "k", -- next item
				},
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!:).
				run = "make install_jsregexp",
			}, -- Required

			-- Adds a number of user-friendly snippets
			{ "rafamadriz/friendly-snippets" },
		},
	})

	use("mbbill/undotree")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				"s1n7ax/nvim-window-picker",
				tag = "v1.*",
				config = function()
					require("window-picker").setup({
						autoselect_one = true,
						include_current = false,
						filter_rules = {
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },

								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
						other_win_hl_color = "#e35e4f",
					})
				end,
			},
		},
		config = function()
			require("neo-tree").setup({
				popup_border_style = "single",
				window = {
					mappings = {
						["l"] = "move_cursor_down",
					},
				},
			})
		end,
	})

	-- Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
	use("tpope/vim-sleuth")

	use("m4xshen/autoclose.nvim")

	use("RRethy/vim-illuminate")
end)
