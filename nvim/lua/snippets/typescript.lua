
local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node

local snippets = {
  -- Header box snippet
  -- s("hdr", {
  --   t({ "// ╔════════════════════════════════════════════════════╗ ts", "// ║                     " }),
  --   i(1, "HEADER NAME"),
  --   t({ "                ║", "// ╚════════════════════════════════════════════════════╝" }),
  -- }),
  
  -- Simple test snippet
  s("test", {
    t("This is a test snippet")
  }),
}

return snippets


