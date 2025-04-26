-- ~/.config/nvim/lua/snippets/all.lua
local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

return {
  -- make this snippet available in *every* filetype:
  all = {
    s("hdr", {
      t({ "// ╔════════════════════════════════════════════════════╗", "// ║                     " }),
      i(1, "HEADER NAME"),
      t({ "                ║", "// ╚════════════════════════════════════════════════════╝" }),
    }),
  },
}
