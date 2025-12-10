return {
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = {
	-- 		{
	-- 			"folke/lazydev.nvim",
	-- 			ft = "lua", -- only load on lua files
	-- 			opts = {
	-- 				library = {
	-- 					-- See the configuration section for more details
	-- 					-- Load luvit types when the `vim.uv` word is found
	-- 					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local capabilities = require('blink.cmp').get_lsp_capabilities()
	-- 		require("lspconfig").lua_ls.setup { capabilities = capabilities }
	-- 		-- require("lspconfig").clangd.setup { capabilities = capabilities }
	-- 		require("lspconfig").jdtls.setup { {
	-- 			settings = {
	-- 				java = {
	-- 					configuration = {
	-- 						runtimes = {
	-- 							{
	-- 								name = "JavaSE-17",
	-- 								path = "C:\\Program Files\\Java\\jdk-17",
	-- 								default = true,
	-- 							},
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		} }
	-- 		require("lspconfig").pyright.setup { capabilities = capabilities, settings = {
	-- 			pyright = {
	-- 				disableOrganizeImports = false
	-- 			},
	-- 			python = {
	-- 				analysis = {
	-- 					ignore = { '*' },
	-- 				},
	-- 			},
	-- 			--
	-- 		} }
	-- 		require("lspconfig").ruff.setup { capabilities = capabilities,
	-- 			init_options = {
	-- 				settings = {
	-- 					logLevel = 'debug',
	-- 					configurationPreference = "filesystemFirst",
	-- 					organizeImports = true,
	-- 					showSyntaxErrors = true,
	-- 					lint = {
	-- 						ignore = { "F403", "F405" },
	-- 						select = { "E", "F" }
	-- 					},
	-- 				}
	-- 			} }
	-- 		vim.api.nvim_create_autocmd('LspAttach', {
	-- 			callback = function(args)
	-- 				local map = function(keys, func, desc, mode)
	-- 					mode = mode or 'n'
	-- 					vim.keymap.set(mode, keys, func,
	-- 						{ buffer = args.buf, desc = 'LSP: ' .. desc })
	-- 				end

	-- 				-- Jump to the definition of the word under your cursor.
	-- 				--  This is where a variable was first declared, or where a function is defined, etc.
	-- 				--  To jump back, press <C-t>.
	-- 				map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

	-- 				-- Find references for the word under your cursor.
	-- 				map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

	-- 				-- Jump to the implementation of the word under your cursor.
	-- 				--  Useful when your language has ways of declaring types without an actual implementation.
	-- 				map('gI', require('telescope.builtin').lsp_implementations,
	-- 					'[G]oto [I]mplementation')

	-- 				-- Jump to the type of the word under your cursor.
	-- 				--  Useful when you're not sure what type a variable is and you want to see
	-- 				--  the definition of its *type*, not where it was *defined*.
	-- 				map('<leader>D', require('telescope.builtin').lsp_type_definitions,
	-- 					'Type [D]efinition')

	-- 				-- Fuzzy find all the symbols in your current document.
	-- 				--  Symbols are things like variables, functions, types, etc.
	-- 				map('<leader>ds', require('telescope.builtin').lsp_document_symbols,
	-- 					'[D]ocument [S]ymbols')

	-- 				-- Fuzzy find all the symbols in your current workspace.
	-- 				--  Similar to document symbols, except searches over your entire project.
	-- 				map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
	-- 					'[W]orkspace [S]ymbols')

	-- 				-- Rename the variable under your cursor.
	-- 				--  Most Language Servers support renaming across files, etc.
	-- 				map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

	-- 				-- Execute a code action, usually your cursor needs to be on top of an error
	-- 				-- or a suggestion from your LSP for this to activate.
	-- 				map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

	-- 				-- See `:help K` for why this keymap
	-- 				map('P', vim.lsp.buf.hover, 'Hover Documentation')
	-- 				map('<C-p>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- 				-- WARN: This is not Goto Definition, this is Goto Declaration.
	-- 				--  For example, in C this would take you to the header.
	-- 				map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

	-- 				-- The following two autocommands are used to highlight references of the
	-- 				-- word under your cursor when your cursor rests there for a little while.
	-- 				--    See `:help CursorHold` for information about when this is executed
	-- 				--

	-- 				-- local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				-- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
	-- 				-- 	local highlight_augroup = vim.api.nvim_create_augroup(
	-- 				-- 		'kickstart-lsp-highlight', { clear = false })
	-- 				-- 	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	-- 				-- 		buffer = args.buf,
	-- 				-- 		group = highlight_augroup,
	-- 				-- 		callback = vim.lsp.buf.document_highlight,
	-- 				-- 	})
	-- 				--
	-- 				-- 	vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
	-- 				-- 		buffer = args.buf,
	-- 				-- 		group = highlight_augroup,
	-- 				-- 		callback = vim.lsp.buf.clear_references,
	-- 				-- 	})
	-- 				--
	-- 				-- 	vim.api.nvim_create_autocmd('LspDetach', {
	-- 				-- 		group = vim.api.nvim_create_augroup('kickstart-lsp-detach',
	-- 				-- 			{ clear = true }),
	-- 				-- 		callback = function(event2)
	-- 				-- 			vim.lsp.buf.clear_references()
	-- 				-- 			vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
	-- 				-- 		end,
	-- 				-- 	})
	-- 				-- end

	-- 				local c = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				if not c then return end

	-- 				if vim.bo.filetype == "lua" then
	-- 					-- Format the current buffer on save
	-- 					vim.api.nvim_create_autocmd('BufWritePre', {
	-- 						buffer = args.buf,
	-- 						callback = function()
	-- 							vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
	-- 						end,
	-- 					})
	-- 				end
	-- 			end,
	-- 		})
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
	-- 			callback = function(args)
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				if client == nil then
	-- 					return
	-- 				end
	-- 				if client.name == 'ruff' then
	-- 					-- Disable hover in favor of Pyright
	-- 					client.server_capabilities.hoverProvider = false
	-- 				end
	-- 			end,
	-- 			desc = 'LSP: Disable hover capability from Ruff',
	-- 		})
	-- 	end,
	-- }

	{
		"williamboman/mason.nvim",
		-- version = "v1.11.0",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			-- manually install packages that do not exist in this list please
			ensure_installed = { "ts_ls", "jdtls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- lua
			vim.lsp.config["lua_ls"] = {
				cmd = { "lua-language-server" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}
			vim.lsp.enable("lua_ls")

			vim.lsp.config["ts_ls"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["eslint"] = {
				capabilities = capabilities,
			}

			-- vim.lsp.config["zls"] = {
			-- 	capabilities = capabilities,
			-- }

			vim.lsp.config["yamlls"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["tailwindcss"] = {
				capabilities = capabilities,
			}

			vim.lsp.config["html"] = {
				capabilities = capabilities,
			}
			-- vim.lsp.config["gopls"] = {
			-- 	capabilities = capabilities,
			-- }

			-- nix
			vim.lsp.config["nil_ls"] = {
				capabilities = capabilities,
			}

			-- protocol buffer
			-- vim.lsp.config["buf_ls"] = {
			-- 	capabilities = capabilities,
			-- }

			-- docker compose
			vim.lsp.config["docker_compose_language_service"] = {
				capabilities = capabilities,
			}

			-- cobol
			-- vim.lsp.config["cobol_ls"] = {
			-- 	capabilities = capabilities,
			-- }

			-- svelte
			-- vim.lsp.config["svelte"] = {
			-- 	capabilities = capabilities,
			-- }
			-- python
			vim.lsp.config["pyright"] = {
				capabilities = capabilities,
			}

			-- bash
			vim.lsp.config["bashls"] = {
				capabilities = capabilities,
			}

			-- protocol buffer
			-- vim.lsp.config["buf_language_server"] = {
			-- 	capabilities = capabilities,
			-- }

			-- vim.lsp.config["asm_lsp"] = {
			-- 	capabilities = capabilities,
			-- }
			--
			vim.diagnostic.config({
				virtual_text = true,
				underline = true,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "proto",
				callback = function()
					vim.lsp.enable("buf_language_server")
				end,
			})
			vim.lsp.enable({
				"ts_ls",
				"eslint",
				"zls",
				"yamlls",
				"html",
				"tailwindcss",
				-- "gopls",
				"nil_ls",
				-- "buf_ls",
				"docker_compose_language_service",
				-- "cobol_ls",
				-- "svelte",
				"pyright",
				"bashls",
				-- "asm_lsp",
			})
			-- lsp kepmap setting
			vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- list all methods in a file
			-- working with go confirmed, don't know about other, keep changing as necessary
			vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					python = "function",
					javascript = "function",
					typescript = "function",
					java = "class",
					lua = "function",
					go = { "method", "struct", "interface" },
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end, {})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function(args)
					require("jdtls.jdtls_setup").setup()
				end,
			})
		end,
	},
}
