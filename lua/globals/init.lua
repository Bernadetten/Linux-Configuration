local options = {
  number = true, -- set numbered lines
  clipboard = "unnamedplus", -- use system clipboard
  spelllang = {"en"}, -- spell language
  wrap = true, -- wrap lines
  hlsearch = true, -- highlights search
  shiftwidth = 2, -- change tabsize to 2
  tabstop = 2, -- change tabsize to 2
	mouse = '',
}

-- apply options
for k, v in pairs(options) do
  vim.opt[k] = v
end

