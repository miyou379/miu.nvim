vim.g.mapleader = " "
local keymap = vim.keymap

-- 改键说明
-- keymap.set("什么模式下改键", "改成什么键", "原来什么键")

-- 插入模式
-- keymap.set("i", "qq", "ESC")

-- 视觉模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 正常模式
-- 创建新窗口
keymap.set("n", "<leader>q", "<C-w>q") -- 关闭当前窗口
keymap.set("n", "<leader>o", "<C-w>o", { desc = 'close others' }) -- 关闭其他所有窗口
keymap.set("n", "<leader>w", "<C-w><C-w>") -- 切换到另一个窗口
keymap.set("n", "<leader>x", "<C-w>x", { desc = 'exchange next' }) -- 当前与下一个窗口交换
keymap.set("n", "<leader>h", "<C-w>s") -- 水平方向分割
keymap.set("n", "<leader>v", "<C-w>v") -- 垂直方向分割
keymap.set("n", "<leader>m", "<C-w>z", { desc = 'maximum' }) -- 窗口最大化
keymap.set("n", "<leader>_", "<C-w>_", { desc = 'max height' }) -- 高度最大化
keymap.set("n", "<leader>|", "<C-w>|", { desc = 'max width' }) -- 宽度最大化
keymap.set("n", "<leader>=", "<C-w>=", { desc = 'equal all' }) -- 所有窗口大小相等

