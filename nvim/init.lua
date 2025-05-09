-- Monkey patch for LSP sync error
local sync = require("vim.lsp.sync")
local original_compute_start_range = sync.compute_start_range

-- Override the compute_start_range function to handle nil prev_line
sync.compute_start_range = function(...)
	local status, result = pcall(original_compute_start_range, ...)
	if not status then
		-- Return a safe default if the original function fails
		return {
			start = { line = 0, character = 0 },
			["end"] = { line = 0, character = 0 },
		}
	end
	return result
end

-- lsp

require("config")
require("plugins")
