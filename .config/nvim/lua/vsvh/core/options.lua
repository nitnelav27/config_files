local opt = vim.opt --just a prefix

-- line numbers
opt.number = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- cursor line
opt.cursorline = true -- Highlights the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark" -- force dark mode in colorschemes
opt.signcolumn = "yes" -- show 'sign column' so that text does not shift
opt.cursorline = true -- highlight current line
opt.visualbell = true -- as the name implies

-- clipboard
opt.clipboard:append("unnamedplus") -- system clipboard as default register

-- split windows
opt.splitright = true -- split vertically to the right
opt.splitbelow = true -- split horizontally to the bottom

-- encoding
opt.encoding = "utf-8"
