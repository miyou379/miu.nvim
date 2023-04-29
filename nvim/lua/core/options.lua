local opt = vim.opt

-- 行号
opt.relativenumber = false
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = true

-- 光标
opt.cursorline = true -- 光标行
opt.guicursor = "a:block,n-c-v:blinkon100"

-- 启用鼠标
opt.mouse:append("a")

-- 使用系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口在右方和下方
opt.splitright = true
opt.splitbelow = true

-- 搜索 (是否区分大小写)
opt.ignorecase = true
opt.smartcase = true

-- 终端真颜色和左侧一列
opt.termguicolors = true
opt.signcolumn = "yes"

-- 设置tab栏显示方式
opt.showtabline = 2
