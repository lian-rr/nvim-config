---@type ChadrcConfig
local M = {}

require "custom.set"
require "custom.remap"

M.ui = { theme = 'onedark' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
