
local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node
return {
  typescript = {
    s("hdr", {
      t({ "// ╔════════════════════════════════════════════════════╗", "// ║                     " }),
      i(1, "HEADER NAME"),
      t({ "                ║", "// ╚════════════════════════════════════════════════════╝" }),
    }),
  },
}
