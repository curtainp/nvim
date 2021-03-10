local global = {}
local os_name = vim.loop.os_uname().sysname
local path_sep = os_name == 'Windows' and '\\' or '/'

function global:load_variables()
  self.home_dir = os.getenv("HOME")
  self.path_sep = path_sep
  self.nvim_config_dir = vim.fn.stdpath('config')
  self.cache_dir = self.home_dir..path_sep..'.cache'..path_sep..'nvim'..path_sep
  self.plugin_modules_dir = self.nvim_config_dir..'modules'
end

global:load_variables()

return global
