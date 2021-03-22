local global = {}
global.os_name = vim.loop.os_uname().sysname
global.path_sep = function ()
  if global.os_name == 'Windows' then
    return '\\'
  end
  return '/'
end

local function load_options()
  local options = {
    termguicolors         = true,             -- enable true color(24-bit RGB color) of TUI
    fileformats           = "mac,unix,dos",   -- given the <EOL> formats when edit a new buffer
    magic                 = true,             -- must be on because of many plugin assume that
    encoding              = "utf-8",
    viewoptions           = "cursor,curdir,folds,slash,unix",         -- effect :mkview command
    sessionoptions        = "curdir,help,tabpages,winsize,slash,unix",-- effect :mksession command
    wildignore            = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";   -- don't include the pattern when completing file and dirname, and expand() globa() globpath()
    backup                = false,
    writebackup           = false,
    undofile              = true,
    swapfile              = false,
    directory             = global.cache_dir.."swap",
    undodir               = global.cache_dir.."undo",
    history               = 1000,
    smarttab              = true,
    shiftround            = true,
    timeout               = true,             -- enable timeout for mapping sequence to complet,wait for <timeoutlen> millisec
    timeoutlen            = 500,
    ttimeout              = true,             -- for TUI version
    ttimeoutlen           = 10,
    ignorecase            = true;
    smartcase             = true;
    infercase             = true;
    incsearch             = true;
    wrapscan              = true;
    complete              = ".,w,b,k";        -- how keyword completion when <C-n> and <C-p> are used, w->scan other window's buf
    inccommand            = "nosplit";
    grepformat            = "%f:%l:%c:%m";
    grepprg               = 'rg --hidden --vimgrep --smart-case --';
    breakat               = [[\ \	;:,!?]];
    startofline           = false;
    whichwrap             = "h,l,<,>,[,],~";
    splitbelow            = true;
    splitright            = true;
    switchbuf             = "useopen";
    backspace             = "indent,eol,start";
    diffopt               = "filler,iwhite,internal,algorithm:patience";
    completeopt           = "menu,menuone,noselect";
    jumpoptions           = "stack";
    showmode              = false;
    shortmess             = "aoOTIcF";
    scrolloff             = 2;
    sidescrolloff         = 5;
    foldlevelstart        = 99;
    ruler                 = false;
    list                  = true;
    showtabline           = 2;
    winwidth              = 30;
    winminwidth           = 10;
    pumheight             = 15;
    helpheight            = 12;
    previewheight         = 12;
    showcmd               = false;
    cmdheight             = 2;
    cmdwinheight          = 5;
    equalalways           = false;
    laststatus            = 2;
    display               = "lastline";
    showbreak             = "↳  ";
    listchars             = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
    pumblend              = 10;
    winblend              = 10;
    synmaxcol             = 2500;
    formatoptions         = "1jcroql";
    textwidth             = 100;
    expandtab             = true;
    autoindent            = true;
    tabstop               = 2;
    shiftwidth            = 2;
    softtabstop           = -1;
    breakindentopt        = "shift:2,min:20";
    wrap                  = false;
    linebreak             = true;
    number                = true;
    colorcolumn           = "100";
    foldenable            = true;
    signcolumn            = "yes";
    conceallevel          = 2;
    concealcursor         = "niv";
  }

  for k , v  in pairs(options) do
    vim.cmd('set ' .. k .. '=' .. v)
  end
end

global.join_paths = function (...)
  return table.concat({...}, global.path_sep)
end

function global:load_variables()
  -- ~/.cache/nvim/
  self.cache_dir = self.join_paths(os.getenv('HOME'), '.cache', 'nvim')
  -- ~/.config/nvim/lua/modules
  self.plugin_modules_dir = self.join_paths(vim.fn.stdpath('config'), 'lua', 'modules')
  -- ~/.local/share/nvim/site/
  self.data_dir = self.join_paths(vim.fn.stdpath('data'), 'site')
  -- ~/.local/share/nvim/site/plugin/packer_compiled.vim
  self.packer_compiled_path = self.join_paths(self.data_dir, 'plugin', 'packer_compiled.vim')
  -- ~/.loca/share/nvim/site/pack/packer/opt/packer.vim
  self.packer_dir = self.join_paths(self.data_dir, 'pack', 'packer', 'opt', 'packer.vim')
  load_options()
end

global:load_variables()

return global
