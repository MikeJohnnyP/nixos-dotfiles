-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

-- local js_based_languages = {
--   "typescript",
--   "javascript",
--   "typescriptreact",
--   "javascriptreact",
--   "vue",
-- }

return {
	{
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
				auto_install = true,
				handlers = {},
				ensure_installed = {
					"python",
					"js-debug-adapter",
					"chrome-debug-adapter",
					"java-debug-adapter",
					"java-test",
				},
			},
		},
	},
	{
		-- NOTE: Yes, you can install new plugins here!
		"mfussenegger/nvim-dap",

		-- NOTE: And you can specify dependencies as well
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
			-- Required dependency for nvim-dap-ui
			"nvim-neotest/nvim-nio",

			-- Show virtual text
			"theHamsta/nvim-dap-virtual-text",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Python debugger
			"mfussenegger/nvim-dap-python",

			-- javascript, typescript framework debug
			"mxsdev/nvim-dap-vscode-js",
			-- build debugger from source
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "echo 'Skip build – using prebuilt'",
			},
			-- {
			-- 	"Joakker/lua-json5",
			-- 	build = "./install.sh",
			-- },
		},
		keys = {
			-- Basic debugging keymaps, feel free to change to your liking!
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Start/Continue",
			},
			{
				"<F1>",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step Into",
			},
			{
				"<F2>",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step Over",
			},
			{
				"<F3>",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step Out",
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle Breakpoint",
			},
			{
				"<leader>dr",
				function()
					require("dap").clear_breakpoints()
				end,
				{ desc = "Clear breakpoints" },
			},
			{
				"<leader>da",
				function()
					require("telescope").extensions.dap.list_breakpoints()
				end,
				{ desc = "List Breakpoints" },
			},
			{
				"<leader>dv",
				function()
					require("telescope").extensions.dap.variables()
				end,
				{ desc = "All varibles on debug" },
			},
			{
				"<leader>dc",
				function()
					require("telescope").extensions.dap.commands()
				end,
				{ desc = "All debug commands" },
			},
			{
				"<leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Debug: Set Breakpoint",
			},
			{
				"<leader>?",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Debug: Eval value",
			},
			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			{
				"<F7>",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug: See last session result.",
			},

			-- {
			-- 	"<leader>da",
			-- 	function()
			-- 	  if vim.fn.filereadable(".vscode/launch.json") then
			-- 		local dap_vscode = require("dap.ext.vscode")
			-- 		dap_vscode.load_launchjs(nil, {
			-- 		  ["pwa-node"] = js_based_languages,
			-- 		  ["chrome"] = js_based_languages,
			-- 		  ["pwa-chrome"] = js_based_languages,
			-- 		})
			-- 	  end
			-- 	  require("dap").continue()
			-- 	end,
			-- 	desc = "Run with Args",
			-- },
		},
		config = function()
			require("nvim-dap-virtual-text").setup()
			local dap = require("dap")
			local dapui = require("dapui")

			-- require("dap-vscode-js").setup({
			-- 		debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			-- 		debugger_cmd = { "node", vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js" },
			-- 		adapters = {
			-- 			"chrome",
			-- 			"pwa-chrome",
			-- 			"pwa-node",
			-- 			"pwa-msedge",
			-- 			"pwa-extensionHost",
			-- 			"node-terminal"
			-- 		},
			-- })

			for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
				local pwaType = "pwa-" .. adapterType

				dap.adapters[pwaType] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						args = {
							vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}

				-- this allow us to handle launch.json configurations
				-- which specify type as "node" or "chrome" or "msedge"
				dap.adapters[adapterType] = function(cb, config)
					local nativeAdapter = dap.adapters[pwaType]

					config.type = pwaType

					if type(nativeAdapter) == "function" then
						nativeAdapter(cb, config)
					else
						cb(nativeAdapter)
					end
				end
			end

			local enter_launch_url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end

			local continue = function()
				-- support for vscode launch.json is partial.
				-- not all configuration options and features supported
				if vim.fn.filereadable(".vscode/launch.json") then
					require("dap.ext.vscode").load_launchjs()
				end
				dap.continue()
			end

			for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file using Node.js (nvim-dap)",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach to process using Node.js (nvim-dap)",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					-- requires ts-node to be installed globally or locally
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file using Node.js with ts-node/register (nvim-dap)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeArgs = { "-r", "ts-node/register" },
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch Chrome (nvim-dap)",
						url = enter_launch_url,
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
					},
					{
						type = "pwa-chrome",
						request = "attach",
						name = "Attach Chrome Windows (PIPE – WSL2 fix)",
						port = 9222,
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
						-- Chỉ cần thêm 1 dòng duy nhất:
						runtimeArgs = { "--remote-debugging-pipe" },
					},
					{
						type = "pwa-msedge",
						request = "launch",
						name = "Launch Edge (nvim-dap)",
						url = enter_launch_url,
						webRoot = "${workspaceFolder}",
						sourceMaps = true,
					},
				}
			end

			-- dap.configurations.java = {
			-- 	{
			-- 		type = "java",
			-- 		request = "attach",
			-- 		name = "Attach to process",
			-- 		hostName = "localhost",
			-- 		processId = require("dap.utils").pick_process,
			-- 	},
			-- 	{
			-- 		name = "Attach Spring Boot",
			-- 		type = "java",
			-- 		request = "attach",
			-- 		hostName = "127.0.0.1",
			-- 		port = 8000,
			-- 	},
			-- }

			-- for _, language in ipairs({ "typescript", "javascript", "svelte", "typescriptreact", "vue" }) do
			-- 	require("dap").configurations[language] = {
			-- 		  -- Debug single nodejs files
			-- 		  {
			-- 			type = "pwa-node",
			-- 			request = "launch",
			-- 			name = "Launch file",
			-- 			program = "${file}",
			-- 			cwd = vim.fn.getcwd(),
			-- 			sourceMaps = true,
			-- 		  },
			-- 		   -- Debug nodejs processes (make sure to add --inspect when you run the process)
			-- 		  {
			-- 			type = "pwa-node",
			-- 			request = "attach",
			-- 			name = "Attach",
			-- 			processId = require("dap.utils").pick_process,
			-- 			cwd = vim.fn.getcwd(),
			-- 			sourceMaps = true,
			-- 		  },
			--
			-- 		  -- Debug web applications (client side)
			-- 		  {
			-- 			type = "pwa-chrome",
			-- 			request = "launch",
			-- 			name = "Launch & Debug Chrome",
			-- 			url = function()
			-- 			  local co = coroutine.running()
			-- 			  return coroutine.create(function()
			-- 				vim.ui.input({
			-- 				  prompt = "Enter URL: ",
			-- 				  default = "http://localhost:3000",
			-- 				}, function(url)
			-- 				  if url == nil or url == "" then
			-- 					return
			-- 				  else
			-- 					coroutine.resume(co, url)
			-- 				  end
			-- 				end)
			-- 			  end)
			-- 			end,
			-- 			webRoot = vim.fn.getcwd(),
			-- 			protocol = "inspector",
			-- 			sourceMaps = true,
			-- 			userDataDir = false,
			-- 		  },
			-- 		-- only if language is javascript, offer this debug action
			-- 		language == "javascript" and {
			-- 			-- use nvim-dap-vscode-js's pwa-node debug adapter
			-- 			type = "pwa-node",
			-- 			-- launch a new process to attach the debugger to
			-- 			request = "launch",
			-- 			-- name of the debug action you have to select for this config
			-- 			name = "Launch file in new node process",
			-- 			-- launch current file
			-- 			program = "${file}",
			-- 			cwd = "${workspaceFolder}",
			-- 		} or nil,
			-- {
			-- 	name = "----- ↓ launch.json configs ↓ -----",
			-- 	type = "",
			-- 	request = "launch",
			-- },
			-- }
			-- end

			dap.configurations.java = {
				{
					name = "Debug Launch (2GB)",
					type = "java",
					request = "launch",
					vmArgs = "" .. "-Xmx2g ",
				},
				{
					name = "Debug Attach (8000)",
					type = "java",
					request = "attach",
					hostName = "127.0.0.1",
					port = 8000,
				},
				{
					name = "Debug Attach (5005)",
					type = "java",
					request = "attach",
					hostName = "127.0.0.1",
					port = 5005,
				},
				{
					name = "My Custom Java Run Configuration",
					type = "java",
					request = "launch",
					-- You need to extend the classPath to list your dependencies.
					-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
					-- classPaths = {},

					-- If using multi-module projects, remove otherwise.
					-- projectName = "yourProjectName",

					-- javaExec = "java",
					mainClass = "replace.with.your.fully.qualified.MainClass",

					-- If using the JDK9+ module system, this needs to be extended
					-- `nvim-jdtls` would automatically populate this property
					-- modulePaths = {},
					vmArgs = "" .. "-Xmx2g ",
				},
			}

			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

				-- On windows you may have to uncomment this:
				detached = false,
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				--    Feel free to remove or use ones that you like more! :)
				--    Don't feel like these are good choices.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			-- Change breakpoint icons
			vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
			vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
			local breakpoint_icons = vim.g.have_nerd_font
					and {
						Breakpoint = "",
						BreakpointCondition = "",
						BreakpointRejected = "",
						LogPoint = "",
						Stopped = "",
					}
				or {
					Breakpoint = "●",
					BreakpointCondition = "⊜",
					BreakpointRejected = "⊘",
					LogPoint = "◆",
					Stopped = "⭔",
				}
			for type, icon in pairs(breakpoint_icons) do
				local tp = "Dap" .. type
				local hl = (type == "Stopped") and "DapStop" or "DapBreak"
				vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
			end

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
			end
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			require("dap-python").setup("python")

			vim.keymap.set("n", "<leader>dc", continue, { desc = "Continue" })
		end,
	},
}
