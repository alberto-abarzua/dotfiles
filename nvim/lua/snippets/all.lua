-- ~/.config/nvim/lua/snippets/all.lua
local ls         = require("luasnip")
local s, t, i, f = ls.snippet, ls.text_node, ls.insert_node, ls.function_node

local LINE_LEN = 43   -- width AFTER the leading "// ╭─" … "─╮"

-- ─── thin-corner box helpers ───
local function top_border(args)
  local width = #args[1][1] + 42
  return "// ╭" .. string.rep("─", width) .. "╮"
end
local function bottom_border(args)
  local width = #args[1][1] + 42
  return "// ╰" .. string.rep("─", width) .. "╯"
end

-- ─── single‐line header helpers ───
local function left_pad(args)
  local title = args[1][1]
  local inner = " " .. title .. " "
  local pad   = math.floor((LINE_LEN - #inner) / 2)
  return string.rep("─", pad)
end
local function right_pad(args)
  local title = args[1][1]
  local inner = " " .. title .. " "
  local pad   = LINE_LEN - #inner - math.floor((LINE_LEN - #inner) / 2)
  return string.rep("─", pad)
end

return {
  -- “sr” → thin-corner sandwich header
  s("sr", {
    f(top_border,    {1}),        -- // ╭───────╮
    t({ "", "// │            ►─────── " }),
    i(1, "HEADER"),
    t({ " ───────◄            │", "" }),
    f(bottom_border, {1}),        -- // ╰───────╯
  }),

  -- “srr” → single-line thin-corner header
  s("srr", {
    t("// ╭─"),
    f(left_pad,  {1}),
    t(" "),
    i(1, "Helper Types"),
    t(" "),
    f(right_pad, {1}),
    t("─╮"),
  }),

  -- tiny test snippet
  s("test", { t("This is a test snippet") }),
}
