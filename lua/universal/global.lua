local global = {}
local os_name = vim.loop.os_uname().sysname
local path_sep = os_name == 'Windows' and '\\' or '/'

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

function global:load_variables()
  self.home_dir = os.getenv("HOME")
  self.path_sep = path_sep
  self.nvim_config_dir = vim.fn.stdpath('config')
  self.cache_dir = self.home_dir..path_sep..'.cache'..path_sep..'nvim'..path_sep
  self.plugin_modules_dir = self.nvim_config_dir..'modules'
  load_options()
end

global:load_variables()

return global
