return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = 20,
            open_mapping = [[<c-\>]], --  Ctrl + \
            hide_numbers = true,
            shade_terminals = false,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "rounded",
                winblend = 0,
            },
            on_create = function(term)
                vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-h>", { buffer = term.bufnr })
                vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-j>", { buffer = term.bufnr })
                vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-k>", { buffer = term.bufnr })
                vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-l>", { buffer = term.bufnr })
            end,
        })

        -- Switch term from Floating mode to horizontal mode
        local function toggle_terminal_direction()
            local terms = require("toggleterm.terminal").get_all()
            local term = terms[1] -- Lấy terminal đầu tiên (ID 1)

            if term then
                local current_dir = term.direction
                local new_dir = (current_dir == "float") and "horizontal" or "float"

                term:close() -- Đóng tạm thời
                term:open(nil, new_dir) -- Mở lại với hướng mới
            else
                -- Nếu chưa có terminal nào, mở mặc định
                vim.cmd("ToggleTerm direction=horizontal")
            end
        end

        local function smart_run()
            vim.cmd("w")

            local ft = vim.bo.filetype
            local file = vim.fn.expand("%") -- Get name of file now
            local output = vim.fn.expand("%:r")
            local cmd = ""

            if ft == "cpp" then
                cmd = string.format("g++ %s -o %s && ./%s", file, output, output)
            elseif ft == "python" then
                if vim.fn.filereadable(".venv/bin/python") == 1 then
                    cmd = string.format(".venv/bin/python %s", file)
                else
                    cmd = string.format("python3 %s", file)
                end
                -- add more language here!
            end

            if cmd ~= "" then
                toggleterm.exec(cmd, 1)
            end
        end

        vim.api.nvim_create_user_command("RunCode", smart_run, {})
        vim.keymap.set("n", "<F5>", smart_run, { desc = "Smart Compile & Run" })
        vim.keymap.set(
            { "n", "t" },
            "<leader>tf",
            toggle_terminal_direction,
            { desc = "Toggle Term Direction (Float/Horizontal)" }
        )
    end,
}
