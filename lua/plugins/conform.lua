return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { { "prettierd" } },
				typescript = { { "prettierd" } },
				svelte = { { "prettierd" } },
				html = { { "prettierd" } },
				css = { { "prettierd" } },
				json = { { "prettierd" } },

				markdown = { { "prettierd" } },
				lua = { "stylua" },
				rust = { "rustfmt" },
				c = { "clang-format" },
            }
        })

		vim.keymap.set({ "n", "v" }, "<leader>l", function()
			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
