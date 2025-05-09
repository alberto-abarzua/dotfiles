require("leap").add_default_mappings()
local leap = require("leap")

leap.setup({
	-- only show up to 100 phase-one targets (so you get labels sooner)
	max_phase_one_targets = 100,
	-- hide unlabeled hints once phase-one is over
	highlight_unlabeled_phase_one = false,
	-- restrict to the current window
	target_windows = { vim.api.nvim_get_current_win() },
	-- remap special keys for smoother jumping
	special_keys = {
		repeat_search = "n",
		repeat_search_back = "N",
		next_phase_one = "<space>",
	},
})

-- single‐char forward/backward (no more 2-letter sequences)
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", {
	desc = "Leap forward to char",
	silent = true,
	remap = true,
})
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", {
	desc = "Leap backward to char",
	silent = true,
	remap = true,
})
