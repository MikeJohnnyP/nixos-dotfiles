return
{
	-- {
	-- 	'folke/tokyonight.nvim',
	-- 	init = function()
	-- 		vim.cmd.colorscheme 'tokyonight-night'
	-- 		vim.cmd.hi 'Comment gui=none'
	-- 	end,
	-- 	opts = {
	-- 		transparent = true, -- Enable this to disable setting the background color
	-- 		terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	-- 		styles = {
	-- 			-- Style to be applied to different syntax groups
	-- 			-- Value is any valid attr-list value for `:help nvim_set_hl`
	-- 			comments = { italic = true },
	-- 			keywords = { italic = false },
	-- 			functions = {},
	-- 			variables = {},
	-- 			-- Background styles. Can be "dark", "transparent" or "normal"
	-- 			sidebars = "dark", -- style for sidebars, see below
	-- 			floats = "dark", -- style for floating windows
	-- 		},
	-- 		dim_inactive = false, -- dims inactive windows
	-- 		lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
	-- 	},
	--
	-- 	on_highlights = function(hl, c)
	-- 		local prompt = "#2d3149"
	-- 		hl.TelescopeNormal = {
	-- 			bg = c.bg_dark,
	-- 			fg = c.fg_dark,
	-- 		}
	-- 		hl.TelescopeBorder = {
	-- 			bg = c.bg_dark,
	-- 			fg = c.bg_dark,
	-- 		}
	-- 		hl.TelescopePromptNormal = {
	-- 			bg = prompt,
	-- 		}
	-- 		hl.TelescopePromptBorder = {
	-- 			bg = prompt,
	-- 			fg = prompt,
	-- 		}
	-- 		hl.TelescopePromptTitle = {
	-- 			bg = prompt,
	-- 			fg = prompt,
	-- 		}
	-- 		hl.TelescopePreviewTitle = {
	-- 			bg = c.bg_dark,
	-- 			fg = c.bg_dark,
	-- 		}
	-- 		hl.TelescopeResultsTitle = {
	-- 			bg = c.bg_dark,
	-- 			fg = c.bg_dark,
	-- 		}
	-- 	end,
	-- 	cache = true, -- When set to true, the theme will be cached for better performance
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	config = true,
	-- 	init = function()
	-- 		vim.o.background = "dark" -- or "light" for light mode
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- 	opts = {
	-- 		terminal_colors = true, -- add neovim terminal colors
	-- 		undercurl = true,
	-- 		underline = true,
	-- 		bold = true,
	-- 		italic = {
	-- 			strings = false,
	-- 			emphasis = true,
	-- 			comments = true,
	-- 			operators = false,
	-- 			folds = false,
	-- 		},
	-- 		strikethrough = true,
	-- 		invert_selection = false,
	-- 		invert_signs = false,
	-- 		invert_tabline = false,
	-- 		invert_intend_guides = false,
	-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
	-- 		contrast = "", -- can be "hard", "soft" or empty string
	-- 		palette_overrides = {},
	-- 		overrides = {},
	-- 		dim_inactive = false,
	-- 		transparent_mode = true,
	-- 	}
	-- }
	--
	-- {
	-- 	'sainnhe/gruvbox-material',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_enable_italic = true
	-- 		vim.g.gruvbox_material_better_performance = true
	-- 		vim.g.gruvbox_material_background = 'hard'
	-- 		vim.g.gruvbox_material_enable_bold = true
	-- 		vim.cmd.hi 'Comment gui=none'
	-- 		vim.g.gruvbox_material_transparent_background = true
	-- 		vim.cmd.colorscheme('gruvbox-material')
	-- 	end
	-- }
	-- {
	-- 	'AlexvZyl/nordic.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('nordic').setup({
	-- 			-- This callback can be used to override the colors used in the base palette.
	-- 			on_palette = function(palette)
	-- 				palette.gray0 = "#0e1415"
	-- 			end,
	-- 			-- This callback can be used to override the colors used in the extended palette.
	-- 			after_palette = function(palette) end,
	-- 			-- This callback can be used to override highlights before they are applied.
	-- 			on_highlight = function(highlights, palette)
	-- 				for _, highlight in pairs(highlights) do
	-- 					highlight.italic = false
	-- 				end
	-- 			end,
	-- 			-- Enable bold keywords.
	-- 			bold_keywords = false,
	-- 			-- Enable italic comments.
	-- 			italic_comments = false,
	-- 			-- Enable editor background transparency.
	-- 			transparent = {
	-- 				-- Enable transparent background.
	-- 				bg = true,
	-- 				-- Enable transparent background for floating windows.
	-- 				float = true,
	-- 			},
	-- 			-- Enable brighter float border.
	-- 			bright_border = true,
	-- 			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
	-- 			reduced_blue = true,
	-- 			-- Swap the dark background with the normal one.
	-- 			swap_backgrounds = false,
	-- 			-- Cursorline options.  Also includes visual/selection.
	-- 			cursorline = {
	-- 				-- Bold font in cursorline.
	-- 				bold = false,
	-- 				-- Bold cursorline number.
	-- 				bold_number = true,
	-- 				-- Available styles: 'dark', 'light'.
	-- 				theme = 'dark',
	-- 				-- Blending the cursorline bg with the buffer bg.
	-- 				blend = 0.85,
	-- 			},
	-- 			noice = {
	-- 				-- Available styles: `classic`, `flat`.
	-- 				style = 'classic',
	-- 			},
	-- 			telescope = {
	-- 				-- Available styles: `classic`, `flat`.
	-- 				style = 'classic',
	-- 			},
	-- 			leap = {
	-- 				-- Dims the backdrop when using leap.
	-- 				dim_backdrop = false,
	-- 			},
	-- 			ts_context = {
	-- 				-- Enables dark background for treesitter-context window
	-- 				dark_background = true,
	-- 			}
	-- 		})
	-- 		require('nordic').load()
	-- 	end
	-- }

	-- {
	-- 	'rebelot/kanagawa.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('kanagawa').setup({
	-- 			compile = false, -- enable compiling the colorscheme
	-- 			undercurl = true, -- enable undercurls
	-- 			commentStyle = { italic = true },
	-- 			functionStyle = {},
	-- 			keywordStyle = { italic = false },
	-- 			statementStyle = { bold = true },
	-- 			transparent = false, -- do not set background color
	-- 			typeStyle = {},
	-- 			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	-- 			terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 			colors = { -- add/modify theme and palette colors
	-- 				palette = {},
	-- 				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- 			},
	-- 			overrides = function(colors) -- add/modify highlights
	-- 				return {}
	-- 			end,
	-- 			theme = "wave", -- Load "wave" theme
	-- 			background = { -- map the value of 'background' option to a theme
	-- 				dark = "wave", -- try "dragon" !
	-- 				light = "lotus"
	-- 			},
	-- 		})
	--
	-- 		-- setup must be called before loading
	-- 		vim.cmd("colorscheme kanagawa")
	-- 	end
	-- }
	--
	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("kanagawa-paper-ink")
		end,
		config = function ()
		require("kanagawa-paper").setup({
			 -- enable undercurls for underlined text
			 undercurl = true,
			 -- transparent background
			 transparent = true,
			 -- highlight background for the left gutter
			 gutter = false,
			 -- background for diagnostic virtual text
			 diag_background = true,
			 -- dim inactive windows. Disabled when transparent
			 dim_inactive = false,
			 -- set colors for terminal buffers
			 terminal_colors = true,
			 -- cache highlights and colors for faster startup.
			 -- see Cache section for more details.
			 cache = false,

			 styles = {
			  -- style for comments
			  comment = { italic = true },
			  -- style for functions
			  functions = { italic = false },
			  -- style for keywords
			  keyword = { italic = false, bold = false },
			  -- style for statements
			  statement = { italic = false, bold = false },
			  -- style for types
			  type = { italic = false },
			 },
			 -- uses lazy.nvim, if installed, to automatically enable needed plugins
			 auto_plugins = true,
			 -- enable highlights for all plugins (disabled if using lazy.nvim)
			 all_plugins = package.loaded.lazy == nil,
			 -- manually enable/disable individual plugins.
			 -- check the `groups/plugins` directory for the exact names
			 plugins = {
			  -- examples:
			  -- rainbow_delimiters = true
			  -- which_key = false
			 },
			})
		end
	}

}
