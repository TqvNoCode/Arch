return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort.with({
                    extra_args = { "--profile", "black" },
                }),
                null_ls.builtins.formatting.clang_format,
                -- null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.diagnostics.ruff,
                -- null_ls.builtins.formatting.gofumpt,
                -- null_ls.builtins.code_actions.impl,
                -- null_ls.builtins.formatting.google_java_format,

                -- C / Assembly
                null_ls.builtins.formatting.asmfmt
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Auto format code" })
    end,
}
