local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("maincpp", {
        t({ "#include <iostream>", "", "int main()", "{", "    " }),
        i(1, 'std::cout << "Hello World!\\n";'),
        t({ "", "    return 0;", "}" }),
    }),
})

vim.keymap.set("n", "<leader>nw", function()
    require("luasnip").jump(1)
end, { silent = true, desc = "LuaSnip jump forward" })
