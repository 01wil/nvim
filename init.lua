vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.guicursor = "n:blinkwait100-blinkon100-blinkoff100,i:ver25-blinkwait100-blinkon100-blinkoff100,v:blinkwait100-blinkon100-blinkoff100"
vim.o.number = true
vim.o.relativenumber = false
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.virtualedit = "all"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.cmdheight = 0
vim.opt.showcmdloc = 'statusline'
vim.wo.signcolumn = "auto:5"
vim.o.updatetime = 300
vim.o.timeoutlen = 300
vim.o.nrformats = "alpha,octal,hex,bin,blank"
vim.o.title = true
vim.o.titlestring = [[%{fnamemodify(getcwd(), ':t')} ❯ %t %m]]
vim.o.confirm = true
vim.o.termguicolors = true
vim.opt.background = "dark"
vim.o.statuscolumn = "%s %l %C "
vim.opt.path:append(",**")
vim.o.list = true
vim.opt.listchars = {
  tab = "«-»",
  trail = "·",
  nbsp = "␣",
  leadmultispace = " │",
  extends = "→",
  precedes = "←",
  -- eol = '↵',
}
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.fillchars = {
    eob = ' ',
    fold = ' ',
    foldopen = '',
    foldclose = '',
    foldsep = ' ',
    foldinner = ' ',
    msgsep = '─',
}
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.cursorcolumn = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.breakindent = true
vim.o.breakindentopt= "shift:8"
vim.o.showbreak = "  ↪  "
vim.o.linebreak = true
vim.o.jumpoptions = "stack,view"
vim.fn.mkdir(vim.fn.stdpath("state") .. "/swap", "p")
vim.o.directory = vim.fn.stdpath("state") .. "/swap//"
vim.o.swapfile = true
vim.fn.mkdir(vim.fn.stdpath("state") .. "/backup", "p")
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup//"
vim.o.backup = false
vim.o.writebackup = true
vim.o.undofile = true
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.colorcolumn = "80"
vim.o.sessionoptions = "blank,buffers,tabpages,curdir,help,localoptions,winsize,winpos,terminal"
vim.o.iskeyword = '@,48-57,192-255,_,-'

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then -- Windows-specific configurations.  vim.fn.has("unix") vim.fn.has("mac")
  vim.o.shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell"
  vim.o.shellxquote = ""
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
  vim.o.shellquote = ""
  vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.o.shellredir = "| Out-File -Encoding UTF8 %s"
end

vim.keymap.set('n', '<leader>q', function()
  if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { desc = 'Toggle quickfix list' })
vim.keymap.set("n", "<leader>b", ":ls<CR>:b ", { desc = "Buffer Navigation" })
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', ']a', ':next<CR>:arg<CR>', { desc = "Next and display Arglist", noremap = true })
vim.keymap.set('n', '[a', ':previous<CR>:arg<CR>', { desc = "Previous and display Arglist", noremap = true })
vim.keymap.set("n", "<leader>a", ":argadd%<CR>:argdedupe<CR>:arg<CR>", { desc = "Add current file to Arglist"})
vim.keymap.set("n", "<leader>x", ":argdelete%<CR>:arg<CR>", { desc = "Remove current file from Arglist"})
vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "d", '"_d', { desc = "Delete without clobbering clipboard" })
vim.keymap.set("x", "<leader>/", "<Esc>/\\%V") --search within visual selection
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>yp", function() vim.fn.setreg("+", vim.fn.expand("%")) end, { desc = "Yank relative path" })
vim.keymap.set("n", "<leader>yP", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Yank absolute path" })
vim.keymap.set("n", "<leader>yf", function() vim.fn.setreg("+", vim.fn.expand("%:t")) end, { desc = "Yank filename" })
vim.keymap.set("n", "<leader>yl", function() vim.fn.setreg("+", vim.fn.expand("%") .. ":" .. vim.fn.line(".")) end, { desc = "Yank path:line" })
vim.keymap.set("n", "<leader>yL", function() vim.fn.setreg("+", vim.fn.expand("%:t") .. ":" .. vim.fn.line(".")) end, { desc = "Yank filename:line" })
vim.keymap.set("n", "<leader>yd", function() vim.api.nvim_put({ os.date("%Y-%m-%d %H:%M:%S") }, "c", true, true) end, { desc = "Insert datetime" })
vim.keymap.set("n", "<leader>yD", function() vim.api.nvim_put({ os.date("%Y%m%d%H%M%S") }, "c", true, true) end, { desc = "Insert datetime (digits only)" })
vim.keymap.set("n", "<leader>yt", function() vim.api.nvim_put({ os.date("%H:%M") }, "c", true, true) end, { desc = "Insert time" })

vim.keymap.set("n", "<leader>ya", function() local r = vim.fn.getreg("+"); vim.fn.setreg("+", r == "" and vim.api.nvim_get_current_line() or r .. "\n" .. vim.api.nvim_get_current_line()) end, { desc = "Append line to clipboard" })
vim.keymap.set("v", "<leader>ya", function() vim.cmd('normal! "zy'); local r = vim.fn.getreg("+"); vim.fn.setreg("+", r == "" and vim.fn.getreg("z") or r .. "\n" .. vim.fn.getreg("z")) end, { desc = "Append selection to clipboard" })

vim.keymap.set("n", "<leader>yc", function() vim.fn.setreg("+", vim.fn.expand("%") .. ":" .. vim.fn.line(".") .. "\n" .. vim.api.nvim_get_current_line()) end, { desc = "Yank path:line + code" })
vim.keymap.set("v", "<leader>yc", function() local loc = vim.fn.expand("%") .. ":" .. vim.fn.line("."); vim.cmd('normal! "zy'); vim.fn.setreg("+", loc .. "\n" .. vim.fn.getreg("z")) end, { desc = "Yank path:line + code" })

vim.keymap.set("n", "<leader>yC", function() vim.fn.setreg("+", vim.fn.expand("%") .. ":" .. vim.fn.line(".") .. "\n" .. string.format("```%s\n%s```", vim.bo.filetype, vim.api.nvim_get_current_line() .. "\n")) end, { desc = "Yank path:line + Markdown code block" })
vim.keymap.set("v", "<leader>yC", function() local loc = vim.fn.expand("%") .. ":" .. vim.fn.line("."); vim.cmd('normal! "zy'); vim.fn.setreg("+", loc .. "\n" .. string.format("```%s\n%s```", vim.bo.filetype, vim.fn.getreg("z"))) end, { desc = "Yank path:line + Markdown code block" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<leader>p", function()
  local root = vim.fs.root(0, ".git") or vim.fn.expand("%:p:h")
  vim.cmd.cd(root)
  print("cwd: " .. root)
end, { desc = "cd to project root (git), else file dir" })

vim.keymap.set("n", "zh", "zH", { desc = "Scroll right" })
vim.keymap.set("n", "zl", "zL", { desc = "Scroll left" })

vim.keymap.set("n", "<C-s-h>", "<C-w>h")
vim.keymap.set("n", "<C-s-j>", "<C-w>j")
vim.keymap.set("n", "<C-s-k>", "<C-w>k")
vim.keymap.set("n", "<C-s-l>", "<C-w>l")

vim.keymap.set("n", "<Up>", "<cmd>resize -5<CR>", { desc = "Shrink window height" })
vim.keymap.set("n", "<Down>", "<cmd>resize +5<CR>", { desc = "Grow window height" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -5<CR>", { desc = "Shrink window width" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +5<CR>", { desc = "Grow window width" })

vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Show diagnostic Error messages" })
vim.keymap.set("n", "<leader>K", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "<leader>FR", "<cmd>retab<CR>", { desc = "[R]etab buffer using current indentation settings" })

if vim.g.RELOPS_ACTIVE == nil then
    vim.g.RELOPS_ACTIVE = true
end

local function refresh_line_numbers()
    if not vim.bo.modifiable or vim.bo.buftype ~= "" or vim.bo.filetype == "help" then
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        return
    end

    local mode = vim.api.nvim_get_mode().mode
    if vim.g.RELOPS_ACTIVE then -- MODERN RELOPS LOGIC
        local targeting_modes = {
          ['no'] = true, -- Operator-pending (pressed d, c, y)
          ['v'] = true, -- Visual
          ['V'] = true, -- Visual Line
          ['\22'] = true, -- Visual Block (CTRL-V)
          ['c'] = true, -- Command-line (typing :)
          ['niI'] = true, -- Operator-pending in Insert mode (rare)
        }
        vim.opt_local.relativenumber = targeting_modes[mode] or false
    else -- STANDARD HYBRID LOGIC
        if mode == 'i' then
            vim.opt_local.relativenumber = false
        else
            vim.opt_local.relativenumber = true
        end
    end
    vim.opt_local.number = true
end

vim.keymap.set("n", "<leader>l", function()
    vim.g.RELOPS_ACTIVE = not vim.g.RELOPS_ACTIVE
    refresh_line_numbers()
    print("ModernRelOps: " .. (vim.g.RELOPS_ACTIVE and "ON" or "OFF"))
end, { desc = "Toggle Numbering Profile" })

vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter", "BufWinEnter", "TermOpen"}, {
    group = vim.api.nvim_create_augroup("DynamicLineNumbers", { clear = true }),
    callback = refresh_line_numbers,
})

vim.keymap.set("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  print("InlayHint: " .. (vim.lsp.inlay_hint.is_enabled() and "ON" or "OFF"))
end, { desc = "Inlay Hints Toggle" })

vim.keymap.set("n", "<leader>L", function()
  vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
  print("CodeLens: " .. (vim.lsp.codelens.is_enabled() and "ON" or "OFF"))
end, { desc = "Toggle CodeLens" })

vim.keymap.set("n", "<leader>dH", function()
  local enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not enabled)
  print("Diagnostics Enabled:", not enabled)
end, { desc = "[D]iagnostics - Toggle [H]ide all Diagnostics" })

vim.keymap.set("n", "<leader>dh", function()
  local config = vim.diagnostic.config()
  local enabled = config.virtual_text ~= false
  vim.diagnostic.config({ virtual_text = not enabled })
  print("Virtual Text Enabled:", not enabled)
end, { desc = "[D]iagnostics - Toggle [H]ide Virtual Text" })

vim.keymap.set("n", "<leader>dl", function()
  local config = vim.diagnostic.config()
  local enabled = config.virtual_lines ~= nil and config.virtual_lines ~= false
  vim.diagnostic.config({
    virtual_lines = not enabled and { current_line = true } or false
  })
  print("Virtual Lines on current line enabled:", not enabled)
end, { desc = "[D]iagnostics - Toggle Virtual Lines on current line" })

vim.keymap.set("n", "<leader>z", function()
  local centered = vim.opt.scrolloff:get() == 999
  vim.opt.scrolloff = centered and 2 or 999
  vim.cmd("normal! zz")
  print("Centered Cursor: " .. (not centered and "ON" or "OFF"))
end, { desc = "Toggle keep cursor centered (auto zz)" })

vim.lsp.inline_completion.enable(true)

vim.keymap.set("n", "<leader>C", function()
    vim.lsp.inline_completion.enable(not vim.lsp.inline_completion.is_enabled())
    print("CoPilot suggestions: " .. (vim.lsp.inline_completion.is_enabled() and "ON" or "OFF"))
end, { desc = "Toggle LSP Inline Completion (Ghost Text)" })

-- Accept the current inline completion (terminal-portable; toggle is on <leader>C in normal mode)
vim.keymap.set("i", "<C-l>", function()
    if not vim.lsp.inline_completion.get() then
        return "<C-l>"
    end
end, { expr = true, desc = "Accept the current inline completion" })

vim.keymap.set("t", "<C-_>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-/>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

local keys = { "!", "@", "#", "$", "%", "^", "&", "*", "(" }
for i, key in ipairs(keys) do
  vim.keymap.set("n", "<leader>" .. key, function()
    local args = vim.fn.argv()
    if i <= #args then
      vim.cmd("argument " .. i)
      vim.cmd("arg")
    else
      print("No arglist entry #" .. i)
    end
  end, {
    noremap = true,
    silent = true,
    desc = "Go to arg " .. i
  })
end

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if i <= #bufs then
      vim.cmd('buffer ' .. bufs[i].bufnr)
    else
      print("No buffer #" .. i)
    end
  end, { silent = true, noremap = true })
end

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    numhl = {
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
    },
    text = {
      [vim.diagnostic.severity.HINT]  = "󰌶 ",
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.WARN]  = "󰀪 ",
    }
  },
  underline = false,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP progress notification (snippet from the snacks.nvim docs)
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    if not _G.Snacks then
      return
    end
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', { -- yank-ring
    callback = function()
        if vim.v.event.operator == 'y' then
            for i = 9, 1, -1 do -- Shift all numbered registers.
                vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
            end
        end
    end,
})

vim.g.SCHEME = "default"

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function()
    pcall(vim.cmd.colorscheme, vim.g.SCHEME)
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(params)
    vim.g.SCHEME = params.match
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "fugitive*",
    "git",
    "help",
    "lspinfo",
    "netrw",
    "notify",
    "qf",
    "query",
    "nvim-undotree",
    "neotest-output",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function()
    vim.keymap.set("n", "q", vim.cmd.close, { desc = "Close the current buffer", buffer = true })
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- highlight on yank and put
local hl_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = hl_group,
    desc = "highlight selection on yank",
    callback = function()
        -- nightly deprecates on_yank in favor of hl_op; stable only has on_yank
        if vim.hl.hl_op then
            vim.hl.hl_op({ higroup = "IncSearch", timeout = 200, on_visual = true })
        else
            vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
        end
    end,
})
-- TextPutPost and vim.hl.hl_op only exist on nightly; skip on stable
if vim.fn.exists("##TextPutPost") == 1 then
    vim.api.nvim_create_autocmd("TextPutPost", {
        group = hl_group,
        desc = "highlight text on put",
        callback = function()
            pcall(vim.hl.hl_op, { higroup = "IncSearch", timeout = 200, on_visual = true })
        end,
    })
end

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
    command = "wincmd =",
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Setup custom right-click contextual menu",
  callback = function()
    vim.api.nvim_command([[menu PopUp.-3- <NOP>]])
    vim.api.nvim_command([[menu PopUp.-4- <NOP>]])
    vim.api.nvim_command([[menu PopUp.Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
    vim.api.nvim_command([[menu PopUp.References <cmd>lua vim.lsp.buf.references()<CR>]])
    vim.api.nvim_command([[menu PopUp.URL gx]])
    vim.api.nvim_command([[menu PopUp.-5- <NOP>]])
    vim.api.nvim_command([[menu PopUp.Back <C-t>]])
    vim.api.nvim_command([[menu PopUp.-6- <NOP>]])
    vim.api.nvim_command([[menu PopUp.Toggle\ \Breakpoint <cmd>:lua require('dap').toggle_breakpoint()<CR>]])
    vim.api.nvim_command([[menu PopUp.Start\ \Debugger <cmd>:DapContinue<CR>]])
    vim.api.nvim_command([[menu PopUp.Run\ \Test <cmd>lua require("neotest").run.run()<CR>]])
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd.packadd('cfilter') --add quickfix filter builtin
    vim.cmd.packadd('termdebug') --add gdb debug command
    vim.cmd.packadd('nvim.difftool')
    vim.cmd.packadd('nvim.undotree')
  end
})

-- UI2: native redesign of the message/cmdline UI (0.12+). Renamed from the
-- old experimental `vim._extui` module. `msg.targets = 'msg'` routes messages
-- into a separate ephemeral window instead of the cmdline.
local ui2_ok, ui2 = pcall(require, "vim._core.ui2")
if ui2_ok then
  ui2.enable({ enable = true, msg = { targets = "msg" } })
end

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { "catppuccin/nvim",  lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim",  lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim",  lazy = false, priority = 1000 },
  { "rose-pine/neovim",  lazy = false, priority = 1000 },
  { "sainnhe/gruvbox-material",  lazy = false, priority = 1000 },
  { 'projekt0n/github-nvim-theme', lazy = false, priority = 1000 },
  { "Mofiqul/vscode.nvim",  lazy = false, priority = 1000 },
  { "oskarnurm/koda.nvim",  lazy = false, priority = 1000 },
  {
    "tpope/vim-fugitive", -- Git related plugins
    config = function()
      vim.api.nvim_create_user_command("Browse", function(args)
        vim.ui.open(args.args)
      end, {
        desc = "Enables using GBrowse without netrw",
        force = true,
        nargs = 1,
      })
    end,
  },
  {
    "tpope/vim-rhubarb",
  },
  { -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = {
        enabled = true,
      },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        -- toggle in a picker with <a-h> / <a-i>, in the explorer with H / I
        hidden = true,
        ignored = false,
        enabled = true,
        sources = {
          files = {
            hidden = true,
            ignored = false,
          },
          explorer = {
            layout = { layout = { position = "right" } },
          }
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>.",       function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>/",       function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>?",       function() Snacks.picker.recent() end, desc = "Recent" },
      { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
      { '<leader>"',       function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>N",       function() Snacks.picker.notifications() end, desc = "Notification History" },
      { "<leader>n",       function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>P",       function() Snacks.picker.projects() end, desc = "Projects" },
      -- find
      { '<leader>f/',      function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>f:",      function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>ff",      function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fa",      function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>fB",      function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader>fd",      function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>fb",      function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>fw",      function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      { "<leader>fD",      function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>fh",      function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>fH",      function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>fi",      function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>fj",      function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>fk",      function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fl",      function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>fm",      function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>fM",      function() Snacks.picker.man() end, desc = "Man Pages" },
      { "<leader>fp",      function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      { "<leader>fq",      function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>fr",      function() Snacks.picker.resume() end, desc = "Resume" },
      { "<leader>fu",      function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>fs",      function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>fS",      function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- git
      { "<leader>gf",      function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>gB",      function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl",      function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL",      function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs",      function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS",      function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd",      function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gF",      function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      { "<leader>gx",      function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      -- { "<leader>gg",      function() Snacks.lazygit() end, desc = "Lazygit" },
      -- gh
      { "<leader>gi",      function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>gp",      function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
      { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
      -- LSP
      { "gd",              function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD",              function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gR",              function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gI",              function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gai",             function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
      { "gao",             function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
      { "grN",             function() Snacks.rename.rename_file() end, desc = "Rename File" },
      -- Other
      { "<leader>uz",       function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>uZ",       function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>us",       function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>uS",       function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>un",       function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>uc",       function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- { "<leader>bd",      function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>uN",       function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<c-/>",            function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",            function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]",               function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[",               function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Override print to use snacks for `:=` command
          if vim.fn.has("nvim-0.11") == 1 then
            vim._print = function(_, ...)
              dd(...)
            end
          else
            vim.print = _G.dd
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>uT")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uC")
          Snacks.toggle.treesitter():map("<leader>ut")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'xzbdmw/colorful-menu.nvim',
      'onsails/lspkind.nvim'
    },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<cr>'] = { 'select_and_accept', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then return cmp.accept()
            else return cmp.select_and_accept() end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },
      appearance = { nerd_font_variant = 'mono' },
      -- cmdline = { completion = { ghost_text = { enabled = true } } },
      completion = {
        trigger = { show_in_snippet = false },
        -- ghost_text = { enabled = true },
        documentation = { auto_show = true },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
              kind_icon = {
                  text = function(ctx)
                      return require('lspkind').symbol_map[ctx.kind] or ''
                  end,
              },
            },
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          sql = { 'snippets', 'dadbod', 'buffer' },
          mysql = { 'snippets', 'dadbod', 'buffer' },
          plsql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    priority = 900,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.install({
        "asm", "bash", "c", "c_sharp", "clojure", "cmake", "cpp", "css", "dart", "dockerfile",
        "eex", "elixir", "erlang", "fish", "gdscript", "go", "gomod", "gosum", "gowork", "graphql",
        "haskell", "heex", "hcl", "html", "java", "javascript", "jsdoc", "json", "json5", "julia",
        "kotlin", "latex", "lua", "luadoc", "make", "markdown", "markdown_inline", "nasm", "ocaml",
        "ocaml_interface", "perl", "php", "php_only", "powershell", "proto", "python", "r", "ruby",
        "rust", "scala", "scss", "sql", "swift", "terraform", "toml", "tsx", "typescript", "typst",
        "xml", "yaml", "zig",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
          select = {
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          },
      })
      local select = require("nvim-treesitter-textobjects.select")
      local function sel(key, capture)
        vim.keymap.set({ "x", "o" }, "a" .. key, function()
          select.select_textobject(capture .. ".outer", "textobjects")
        end, { desc = "around " .. capture })
        vim.keymap.set({ "x", "o" }, "i" .. key, function()
          select.select_textobject(capture .. ".inner", "textobjects")
        end, { desc = "inner " .. capture })
      end

      sel("f", "@function")
      sel("c", "@class")
      sel("o", "@block")
      sel("l", "@loop")
      sel("g", "@conditional")
      sel("z", "@statement") -- outer only, inner will no-op
      sel("r", "@return")
      sel("m", "@parameter")
      sel("a", "@assignment")
      sel("n", "@number")
      sel("x", "@regex")
      sel("k", "@comment")
      sel("C", "@call")
      sel("A", "@attribute")
      sel("F", "@frame")
      sel("S", "@scopename")

      vim.keymap.set({ "x", "o" }, "iL", function()
        select.select_textobject("@assignment.lhs", "textobjects")
      end, { desc = "inner assignment lhs" })
      vim.keymap.set({ "x", "o" }, "iR", function()
        select.select_textobject("@assignment.rhs", "textobjects")
      end, { desc = "inner assignment rhs" })

      local move = require("nvim-treesitter-textobjects.move")
      local function mov(key, capture)
        -- next
        vim.keymap.set({ "n", "x", "o" }, "]" .. key:upper(), function()
          move.goto_next_end(capture .. ".outer", "textobjects")
        end, { desc = "Next " .. capture .. " end" })
        vim.keymap.set({ "n", "x", "o" }, "]" .. key, function()
          move.goto_next_start(capture .. ".outer", "textobjects")
        end, { desc = "Next " .. capture .. " start" })
        -- previous
        vim.keymap.set({ "n", "x", "o" }, "[" .. key:upper(), function()
          move.goto_previous_end(capture .. ".outer", "textobjects")
        end, { desc = "Previous " .. capture .. " end" })
        vim.keymap.set({ "n", "x", "o" }, "[" .. key, function()
          move.goto_previous_start(capture .. ".outer", "textobjects")
        end, { desc = "Previous " .. capture .. " start" })
      end

      mov("f", "@function")
      mov("o", "@block")
      mov("l", "@loop")
      mov("g", "@conditional")
      mov("r", "@return")
      mov("a", "@assignment")
      mov("C", "@call")
      mov("p", "@parameter")
      mov("A", "@attribute")
      mov("F", "@frame")
      mov("S", "@scopename")
      mov("k", "@comment")

      vim.keymap.set({ "n", "x", "o" }, "]}", function()
        move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next " .. "@class.outer" .. " end" })
      vim.keymap.set({ "n", "x", "o" }, "]{", function()
        move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next " .. "@class.outer" .. " start" })
      -- previous
      vim.keymap.set({ "n", "x", "o" }, "[}", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous " .. "@class.outer" .. " end" })
      vim.keymap.set({ "n", "x", "o" }, "[{", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous " .. "@class.outer" .. " start" })

      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

      vim.keymap.set("n", "<leader>>", function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })
      vim.keymap.set("n", "<leader><", function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
      end, { desc = "Swap previous parameter" })
    end,
  },
  {
    'aaronik/treewalker.nvim',
    config = function()
      require('treewalker').setup{}
      -- movement (terminal-portable: bracket pairs instead of Alt)
      vim.keymap.set({ 'n', 'v' }, '[t', '<cmd>Treewalker Up<cr>', { silent = true, desc = 'Treewalker Up' })
      vim.keymap.set({ 'n', 'v' }, ']t', '<cmd>Treewalker Down<cr>', { silent = true, desc = 'Treewalker Down' })
      vim.keymap.set({ 'n', 'v' }, '[T', '<cmd>Treewalker Left<cr>', { silent = true, desc = 'Treewalker Left (out)' })
      vim.keymap.set({ 'n', 'v' }, ']T', '<cmd>Treewalker Right<cr>', { silent = true, desc = 'Treewalker Right (in)' })
      -- swapping (under <leader>m = move node)
      vim.keymap.set('n', '<leader>mk', '<cmd>Treewalker SwapUp<cr>', { silent = true, desc = 'Swap node up' })
      vim.keymap.set('n', '<leader>mj', '<cmd>Treewalker SwapDown<cr>', { silent = true, desc = 'Swap node down' })
      vim.keymap.set('n', '<leader>mh', '<cmd>Treewalker SwapLeft<cr>', { silent = true, desc = 'Swap node left' })
      vim.keymap.set('n', '<leader>ml', '<cmd>Treewalker SwapRight<cr>', { silent = true, desc = 'Swap node right' })
    end,
  },
  {
    "mason-org/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "copilot-language-server", -- Copilot
        "omnisharp", "csharpier", -- .NET
        "sqlfluff", -- SQL
        "lua-language-server", "stylua", "selene", -- Lua
        "typescript-language-server", "prettierd", "eslint_d", -- JavaScript and TypeScript
        "html-lsp", "css-lsp", "stylelint", -- HTML and CSS
        "json-lsp", -- JSON
        "basedpyright", "ruff", -- Python
        "clangd", "clang-format", -- C and C++
        "bash-language-server", "shellcheck", "shfmt", -- Bash and shell
        "powershell-editor-services", -- PowerShell
        "jdtls", "google-java-format", -- Java
        "kotlin-lsp", "ktfmt", "ktlint", -- Kotlin
        "intelephense", "php-cs-fixer", "phpstan", -- PHP
        "rust-analyzer", -- Rust
        "yaml-language-server", "yamlfmt", "yamllint", -- YAML
        "taplo", -- TOML
        "lemminx", "xmlformatter", -- XML
        "marksman", "markdownlint-cli2", -- Markdown
        "docker-language-server", "hadolint", -- Docker
        "terraform-ls", "tflint", -- Terraform
        "cmakelang", -- CMake
        -- Runtime-dependent tools
        { "gopls", condition = function() return vim.fn.executable("go") == 1 end }, -- Go; requires Go
        { "gofumpt", condition = function() return vim.fn.executable("go") == 1 end },
        { "goimports", condition = function() return vim.fn.executable("go") == 1 end },
        { "golangci-lint", condition = function() return vim.fn.executable("go") == 1 end },
        { "sqls", condition = function() return vim.fn.executable("go") == 1 end }, -- SQL; requires Go
        { "ruby-lsp", condition = function() return vim.fn.executable("gem") == 1 end }, -- Ruby; requires RubyGems
        { "rubocop", condition = function() return vim.fn.executable("gem") == 1 end },
      },
      auto_update = false,
      -- install with :MasonToolsInstall, update with :MasonToolsUpdate
      run_on_start = false,
    },
  },
  {
    -- LSP CONFIG
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
          return { capabilities = require("blink.cmp").get_lsp_capabilities() }
        end,
      },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
      vim.lsp.config("lua_ls", { settings = { Lua = { workspace = { checkThirdParty = false } } } })
      -- easy-dotnet owns C#; OmniSharp is retained only for Visual Basic.
      vim.lsp.config("omnisharp", { filetypes = { "vb" } })
      vim.lsp.enable({
        "basedpyright", "bashls", "clangd", "cmake", "copilot", "cssls",
        "docker_language_server", "gopls", "html", "intelephense", "jdtls", "jsonls",
        "kotlin_lsp", "lemminx", "lua_ls", "marksman", "omnisharp", "powershell_es",
        "ruby_lsp", "rust_analyzer", "sqls", "taplo", "terraformls", "yamlls",
      })

      -- Keymaps only set when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LanguageSupportLspAttach", { clear = true }),
        callback = function(ev)
          local bufnr = ev.buf

          vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
            { buffer = bufnr, desc = "[W]orkspace [A]dd Folder" })
          vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
            { buffer = bufnr, desc = "[W]orkspace [R]emove Folder" })
          vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { buffer = bufnr, desc = "[W]orkspace [L]ist Folders" })

          vim.keymap.set({ "n", "x" }, "grf", function()
            require("conform").format({ bufnr = bufnr, async = true })
          end, { buffer = bufnr, desc = "Format buffer or selection" })

          -- Jump to next error
          vim.keymap.set("n", "]e", function()
            vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
          end, { buffer = bufnr, desc = "Next Error" })
          -- Jump to previous error
          vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
          end, { buffer = bufnr, desc = "Previous Error" })

        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    keys = {
      {
        "<leader>FL",
        function() require("lint").try_lint() end,
        desc = "[L]int buffer",
      },
    },
    config = function()
      require("lint").linters_by_ft = {
        bash = { "shellcheck" }, c = { "clangtidy" }, cpp = { "clangtidy" },
        css = { "stylelint" }, dockerfile = { "hadolint" },
        go = { "golangcilint" }, javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" }, kotlin = { "ktlint" }, lua = { "selene" },
        markdown = { "markdownlint-cli2" }, php = { "phpstan" },
        python = { "ruff" }, ruby = { "rubocop" }, rust = { "clippy" }, scss = { "stylelint" },
        sh = { "shellcheck" }, sql = { "sqlfluff" }, terraform = { "tflint" },
        typescript = { "eslint_d" }, typescriptreact = { "eslint_d" }, yaml = { "yamllint" },
      }
    end,
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    ft = { "cs" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("easy-dotnet").setup({
        -- Roslyn LSP and the netcoredbg debugger are configured out of the box.
        -- `auto_register_dap` (default true) registers dap.configurations.cs, so
        -- <F5>/dap.continue() works: open a .cs file, set a breakpoint, press <F5>,
        -- then pick the project/DLL (easy-dotnet resolves it via get_debug_dll).
        test_runner = {
          -- Let neotest own the buffer signs/keymaps to avoid duplicates.
          neotest_integration = true,
        },
      })
    end
  },
  {
    "folke/which-key.nvim",
    event = "UIEnter",
    config = function()
      require("which-key").setup({
        preset = "helix",
        sort = { "group", "alphanum", "mod" },
      })
      require("which-key").add({
        { "<leader>B",  group = "[B]ug" },
        { "<leader>B_", hidden = true },
        { "<leader>D",  group = "[D]atabase" },
        { "<leader>D_", hidden = true },
        { "<leader>R",  group = "[R]un HTTP" },
        { "<leader>R_", hidden = true },
        { "<leader>T",  group = "[T]est" },
        { "<leader>T_", hidden = true },
        { "<leader>d",  group = "[D]iagnostics" },
        { "<leader>d_", hidden = true },
        { "<leader>f",  group = "[F]ind" },
        { "<leader>f_", hidden = true },
        { "<leader>s",  group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>F",  group = "[F]ormat / Lint" },
        { "<leader>F_", hidden = true },
        { "<leader>g",  group = "[G]it" },
        { "<leader>g_", hidden = true },
        { "<leader>h",  group = "[H]unk Git" },
        { "<leader>h_", hidden = true },
        { "<leader>t",  group = "[T]rouble" },
        { "<leader>t_", hidden = true },
        { "<leader>m",  group = "[M]ove node" },
        { "<leader>m_", hidden = true },
        { "<leader>w",  group = "[W]orkspace" },
        { "<leader>w_", hidden = true },
        { "<leader>A",  group = "[A]I Assistant" },
        { "<leader>A_", hidden = true },
        { "<leader>u",  group = "[U]I Toggles"},
        { "<leader>u_", hidden = true },
        { "<leader>y",  group = "[y]ank / paste" },
        { "<leader>y_", hidden = true },
        { "<leader>1",  hidden = true },
        { "<leader>2",  hidden = true },
        { "<leader>3",  hidden = true },
        { "<leader>4",  hidden = true },
        { "<leader>5",  hidden = true },
        { "<leader>6",  hidden = true },
        { "<leader>7",  hidden = true },
        { "<leader>8",  hidden = true },
        { "<leader>9",  hidden = true },
        { "<leader>!",  hidden = true },
        { "<leader>@",  hidden = true },
        { "<leader>#",  hidden = true },
        { "<leader>$",  hidden = true },
        { "<leader>%",  hidden = true },
        { "<leader>^",  hidden = true },
        { "<leader>&",  hidden = true },
        { "<leader>*",  hidden = true },
        { "<leader>(",  hidden = true },
        -- VISUAL mode <leader> mappings (must live in the main spec, not opts)
        { "<leader>",   group = "VISUAL",      mode = "x" },
        { "<leader>/",  desc = "Search within selection", mode = "x" },
        { "<leader>c",  desc = "AI: [C]hat about selection", mode = "x" },
        { "<leader>f",  group = "[F]ind",       mode = "x" },
        { "<leader>g",  group = "[G]it",        mode = "x" },
        { "<leader>h",  group = "[H]unk Git",   mode = "x" },
        { "<leader>A",  group = "[A]I Assistant", mode = "x" },
        { "<leader>F",  group = "[F]ormat / Lint", mode = "x" },
        { "<leader>s",  group = "[S]earch",     mode = "x" },
        { "<leader>t",  group = "[T]rouble",    mode = "x" },
        { "<leader>T",  group = "[T]est",       mode = "x" },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ "n", "x" }, "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.nav_hunk("next")
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next hunk" })

        map({ "n", "x" }, "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.nav_hunk("prev")
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous hunk" })

        -- Actions
        -- visual mode
        map("x", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "stage git hunk" })
        map("x", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "reset git hunk" })
        -- normal mode
        map("n", "<leader>hs", gs.stage_hunk, { desc = "git stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "git reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "git Stage buffer" })
        -- stage_hunk on a staged hunk unstages it (replaces deprecated undo_stage_hunk)
        map("n", "<leader>hu", gs.stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "git Reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "preview git hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = false })
        end, { desc = "git blame line" })
        map("n", "<leader>hd", gs.diffthis, { desc = "git diff against index" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "git diff against last commit" })

        -- Toggles
        map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "toggle git blame line" })
        map("n", "<leader>gD", gs.preview_hunk_inline, { desc = "preview hunk inline (show deleted)" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {                              -- Set lualine as statusline
    "nvim-lualine/lualine.nvim", -- See `:help lualine.txt`
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
    },
    opts = {
      options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "fancy_mode", width = 1 },
        },
        lualine_b = {
          { "fancy_branch" },
          { "fancy_diff" },
        },
        lualine_c = {
          { "fancy_cwd", substitute_home = true },
          { "filename" },
        },
        lualine_x = {
          { '%S' },
          { "fancy_macro" },
          { "fancy_diagnostics" },
          { "fancy_searchcount" },
          { "fancy_location" },
        },
        lualine_y = {
          { "fancy_filetype", ts_icon = "" },
        },
        lualine_z = {
          { "lsp_status", show_name = false },
          { "fancy_lsp_servers" },
        },
      },
      -- tabline = {
      --   lualine_a = { 'buffers' },
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = { 'tabs' }
      -- }
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },
    keys = {
      { "<leader>BC", function() require("dap").continue() end,          desc = "Debug: Start/Continue" },
      { "<leader>BI", function() require("dap").step_into() end,         desc = "Debug: Step Into" },
      { "<leader>BO", function() require("dap").step_over() end,         desc = "Debug: Step Over" },
      { "<leader>BU", function() require("dap").step_out() end,          desc = "Debug: Step Out" },
      { "<leader>BP", function() require("dap").toggle_breakpoint() end, desc = "Code Debug: Toggle Breakpoint" },
      {
        "<leader>Bp",
        function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        desc = "Code Debug: Set conditional Breakpoint"
      },
      { "<leader>BB", function() require("dapui").toggle() end,      desc = "Debug: Toggle UI & See last session result." },
      { "<leader>Bc", function() require("dap").run_to_cursor() end, desc = "Debug: Run to Cursor" },
      { "<leader>BR", function() require("dap").repl.toggle() end,   desc = "Debug: Toggle REPL" },
      { "<leader>BJ", function() require("dap").down() end,          desc = "Debug: Go Down Stack Frame" },
      { "<leader>BK", function() require("dap").up() end,            desc = "Debug: Go Up Stack Frame" },
      {
        "<leader>BQ",
        function() require("dap").terminate() end,
        desc = "Debug: Terminate"
      },
      { "<leader>BX", function() require("dap").clear_breakpoints() end, desc = "Debug: Clear Breakpoints" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.api.nvim_set_hl(0, "DapBreakpoint",            { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition",   { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "DapLogPoint",              { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected",    { fg = "#BE5046" })
      vim.api.nvim_set_hl(0, "DapStopped",               { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "DapStoppedLine",           { bg = "#2c313c" })

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })

      vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DapBreakpointCondition",
        numhl = "DapBreakpointCondition",
      })

      vim.fn.sign_define("DapLogPoint", {
        text = "",
        texthl = "DapLogPoint",
        numhl = "DapLogPoint",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "",
        texthl = "DapBreakpointRejected",
        numhl = "DapBreakpointRejected",
      })

      vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DapStopped",
        linehl = "DapStoppedLine",
        numhl = "DapStopped",
      })

      require("mason-nvim-dap").setup({
        automatic_installation = false,
        handlers = {},
        -- .NET debugging is handled by easy-dotnet (bundled netcoredbg + its own
        -- dap.configurations.cs). Don't install/register coreclr here or it will
        -- create a second, conflicting C# debug configuration.
        ensure_installed = vim.fn.executable("go") == 1
          and { "bash", "codelldb", "delve", "js", "php", "python" }
          or { "bash", "codelldb", "js", "php", "python" },
      })

      dapui.setup({
        icons = {
          expanded = "▾",
          collapsed = "▸",
          current_frame = "●",
        },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "↳",
            step_over = "↷",
            step_out = "↰",
            step_back = "↶",
            run_last = "⟳",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })
      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "GustavEikaas/easy-dotnet.nvim",
      "nvim-neotest/neotest-python",
      "fredrikaverpil/neotest-golang",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "AkisArou/neotest-nodejs",
      "orjangj/neotest-ctest",
      "olimorris/neotest-phpunit",
      "rouge8/neotest-rust",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
      "rcasia/neotest-bash",
      "MisanthropicBit/neotest-busted",
      "nvim-neotest/neotest-plenary",
    },
    keys = {
      { "<leader>TS", "<cmd>Neotest summary toggle<CR>",                             mode = "", desc = "[T]est: [S]ummary toggle" },
      { "<leader>Tt", "<cmd>Neotest output toggle<CR>",                              mode = "", desc = "[T]est: Output line toggle" },
      { "<leader>TT", "<cmd>Neotest output-panel toggle<CR>",                        mode = "", desc = "[T]est: Output panel toggle" },
      { "<leader>TN", '<cmd>lua require("neotest").run.run()<CR>',                   mode = "", desc = "[T]est: Run [N]earest Test" },
      { "<leader>TF", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', mode = "", desc = "[T]est: Run [F]ile" },
      { "<leader>TA", '<cmd>lua require("neotest").run.attach()<CR>',                mode = "", desc = "[T]est: [A]ttach to nearest [T]est" },
      { "<leader>TB", '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', mode = "", desc = "[T]est: De[b]ug nearest Test" },
      { "<leader>Ts", '<cmd>lua require("neotest").run.stop()<CR>',                  mode = "", desc = "[T]est: [S]top" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("easy-dotnet.neotest"), require("neotest-bash")({}), require("neotest-ctest"),
          require("neotest-golang")({}), require("neotest-jest")({}), require("neotest-minitest")({}),
          require("neotest-nodejs")({}), require("neotest-phpunit")({}),
          require("neotest-plenary"), require("neotest-python")({}), require("neotest-rspec")({}),
          require("neotest-rust")({}), require("neotest-vitest")({}), require("neotest-busted")({}),
        },
      })
    end,
  },
  {
    -- SQL Server requires sqlcmd: https://learn.microsoft.com/sql/tools/sqlcmd/sqlcmd-download-install
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    keys = {
      { "<leader>DD", "<cmd>DBUIToggle<CR>", desc = "Database: Toggle UI" },
      { "<leader>DA", "<cmd>DBUIAddConnection<CR>", desc = "Database: Add Connection" },
      { "<leader>DF", "<cmd>DBUIFindBuffer<CR>", desc = "Database: Find Buffer" },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      -- Queries execute only through <leader>DR, never as a side effect of :write.
      vim.g.db_ui_execute_on_save = 0

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function(event)
          vim.schedule(function()
            if not vim.api.nvim_buf_is_valid(event.buf) or not vim.b[event.buf].dbui_db_key_name then return end
            vim.keymap.set({ "n", "x" }, "<leader>DR", "<Plug>(DBUI_ExecuteQuery)",
              { buffer = event.buf, desc = "Database: Run Query" })
            vim.keymap.set("n", "<leader>DS", "<Plug>(DBUI_SaveQuery)",
              { buffer = event.buf, desc = "Database: Save Query" })
            vim.keymap.set("n", "<leader>DP", "<Plug>(DBUI_EditBindParameters)",
              { buffer = event.buf, desc = "Database: Edit Parameters" })
            vim.keymap.set("n", "<leader>DC", "<cmd>DBCompletionClearCache<CR>",
              { buffer = event.buf, desc = "Database: Clear Completion Cache" })
          end)
        end,
      })
    end,
  },
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = true,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
  {
    "DamianVCechov/hexview.nvim",
    config = function()
      require("hexview").setup()
    end
  },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>ss",
        function() require("grug-far").open() end,
        desc = "grug-far: Search in project",
        mode = "n",
      },
      {
        "<leader>sf",
        function() require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } }) end,
        desc = "grug-far: Search in current file",
        mode = "n",
      },
      {
        "<leader>sw",
        function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end,
        desc = "grug-far: Search using word under cursor",
        mode = "n",
      },
      {
        "<leader>s/",
        function()
          local search = vim.fn.getreg("/")
          -- surround with \b if "word" search (such as when pressing `*`)
          if search and vim.startswith(search, "\\<") and vim.endswith(search, "\\>") then
            search = "\\b" .. search:sub(3, -3) .. "\\b"
          end
          require("grug-far").open({
            prefills = {
              search = search,
            },
          })
        end,
        desc = "grug-far: Search using @/ register value or visual selection",
        mode = { "n", "x" },
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>",                        mode = "", desc = "[T]rouble [T]oggle" },
      { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>",                mode = "", desc = "[T]rouble [S]ymbols" },
      { "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           mode = "", desc = "[T]rouble [D]ocument Diagnostics" },
      { "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                             mode = "", desc = "[T]rouble [Q]uickfix" },
      { "<leader>tl", "<cmd>Trouble loclist toggle<cr>",                            mode = "", desc = "[T]rouble [L]ocation List" },
      { "<leader>tr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", mode = "", desc = "[T]rouble LSP [R]eferences" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      -- Default keymaps (nvim-surround v4):
      --   ys{motion}{char}     add surround around a motion (e.g. ysiw")
      --   yss{char}            add surround around the current line
      --   yS{motion}/ySS       add surround, delimiters on their own lines
      --   ds{char}             delete the surrounding {char}
      --   cs{target}{repl}     change surrounding {target} to {repl}
      --   cS{target}{repl}     change surround, delimiters on their own lines
      --   visual  S{char}      surround the visual selection
      --   insert  <C-g>s / <C-g>S   add surround around the cursor
      require("nvim-surround").setup({})
    end,
  },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = vim.env.TMUX ~= nil and vim.fn.executable("tmux") == 1,
        },
      },
    },
    keys = {
      {
        "<tab>",
        function()
          -- if there is a next edit, jump to it, otherwise apply it if any
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>" -- fallback to normal tab
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<C-S-CR>",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>AA",
        function() require("sidekick.cli").toggle() end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>AS",
        function() require("sidekick.cli").select() end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>AD",
        function() require("sidekick.cli").close() end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>AT",
        function() require("sidekick.cli").send({ msg = "{this}" }) end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>AF",
        function() require("sidekick.cli").send({ msg = "{file}" }) end,
        desc = "Send File",
      },
      {
        "<leader>AV",
        function() require("sidekick.cli").send({ msg = "{selection}" }) end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>AP",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>AC",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
  { "brenoprata10/nvim-highlight-colors", event = { "BufReadPost", "BufNewFile" }, config = function() require("nvim-highlight-colors").setup() end },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact", "typescriptreact", "vue", "svelte", "xml" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,          -- Auto close tags
          enable_rename = true,         -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      })
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "folke/snacks.nvim" },
    },
    config = function()
      require("tiny-code-action").setup()
      vim.keymap.set( { "n", "x" }, "<leader>c", function()
        require("tiny-code-action").code_action()
      end, { desc = "LSP: Code Action (Preview)", noremap = true, silent = true })
    end,
  },
  {
    "zegervdv/nrpattern.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nrpattern").setup()
    end,
  },
  {
    "isakbm/gitgraph.nvim",
    ---@type I.GGConfig
    opts = {
      symbols = {
        merge_commit = "M",
        commit = "*",
      },
      format = {
        timestamp = "%H:%M:%S %d-%m-%Y",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
    },
    keys = { { "<leader>gg", function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end, desc = "GitGraph - Draw" } },
  },
  {
    "Bekaboo/dropbar.nvim",
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "Wansmer/treesj",
    keys = { { "<leader>j", function() require("treesj").toggle() end, desc = "Toggle Join/Split of Code Block" } },
    opts = { use_default_keymaps = false, max_join_length = 1000 },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          -- vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          -- lua = "rainbow-delimiters",
        },
        priority = {
          [""] = 110,
          -- lua = 110,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({})
      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "[E]dit Filetree with vim keymaps" })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("bufferline").setup({
        options = {
          themable = false,
          indicator = {
            style = "underline",
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          diagnostics = "nvim_lsp",
          -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon
          end,
          separator_style = "slant",
        },
      })
    end,
  },
  { -- Autoformat
    "stevearc/conform.nvim",
    cmd = { "ConformInfo", "Format" },
    init = function()
      vim.api.nvim_create_user_command("Format", function(args)
        require("conform").format({ async = false, range = args.range == 0 and nil or {
          start = { args.line1, 0 },
          ["end"] = { args.line2, 0 },
        } })
      end, { desc = "Format the current buffer or range", range = true })
    end,
    keys = {
      {
        "<leader>FF",
        function() require("conform").format({ async = false }) end,
        mode = { "n", "x" },
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = nil,
      default_format_opts = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        bash = { "shfmt" },
        c = { "clang-format" },
        cmake = { "cmake_format" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        css = { "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofumpt" },
        html = { "prettierd", "prettier", stop_after_first = true },
        java = { "google-java-format" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        kotlin = { "ktfmt" },
        lua = { "stylua" },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        php = { "php_cs_fixer" },
        python = { "ruff_format" },
        ruby = { "rubocop" },
        rust = { "rustfmt" },
        scss = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shfmt" },
        sql = { "sqlfluff" },
        terraform = { "terraform_fmt" },
        toml = { "taplo" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        xml = { "xmlformatter" },
        yaml = { "yamlfmt" },
      },
    },
  },
}, {})

-- INFO:
-- :.!date  Replace line with date output
-- !ip sort Sort paragraph
-- !ap jq . Format JSON in paragraph
-- :%!column -t Align entire file
-- Instead of pressing ^ you can press _(underscore) to jump to the first non-whitespace character on the same line the cursor is on.
-- + and - jump to the first non-whitespace character on the next / previous line.
-- In visual mode press 'o' to switch the side of the selection the cursor is on.
-- or press 'O' to switch the corner of the block selection.
-- :t and :m to copy/move lines. E.g. :3t. to copy line 3 below the current line.
-- :m-2 to move the current line above line 2.
-- :t0 or :t$ to copy line to start/end of file.
-- :g/error/t$ to copy all lines containing 'error' to the end of the file.
-- :s/a\zsb\zec/2 changes the first "b" that's preceded by "a" and followed by "c" to be a 2 (without changing "a" or "c"):
-- An underscore adds a newline to any character class e.g. \s -> space and tab, \_s -> space,tab and newline
-- g; and g, to go to the next/previous change in the undo history. (:changes)
-- :'<,'>norm A; to append a semicolon to all selected lines in visual mode.
-- :'<,'>norm I// to insert '//' at the beginning of all selected lines in visual mode.
-- gU to uppercase, gu to lowercase, g~ to toggle case.
-- gUU to uppercase the entire line, guu to lowercase the entire line, g~~ to toggle case of the entire line.
-- In insert mode press CTRL-o to execute one normal mode command and go back to insertmode.
-- While searching with / or ? press CTRL-g and CTRL-t to go to next/previous occurence without leaving search.
-- with :u[ndo]0 you can go to the first change in the undo history. with :e[dit]! you can revert the buffer to the last saved state.
-- while in insert mode press CTRL-D or CTRL-T to decrease/increase the indentation of the current line.
-- When in search (/) you can press CTRL-l to insert the next character of the current match. CTRL-g and CTRL-t to go to next/previous occurence/match without leaving search.
-- y/<searchterm> then <C-g>/<C-t> to select next/prev match before executing operator (y, d, c, ...).
-- Special DOT behaviour: If the operation repeated with DOT is referencing a numbered register (1-9) the number is incremented. 
-- git log -S <string> to find commits that changed the number of occurences of string. git log -G <regex> look for differences whose patch text contains added/removed lines that match <regex>. git log -L :funcname:file to see the history of changes to a function. git log -L<start>,<end>:file to see the history of changes to a range of lines in a file. (<start> and <end> can be total line numbers or <start> total number and <end> relative line count ( + or - ) or both can be regex).
-- :GcLog to load commits into quickfix list.

-- https://vimregex.com/
-- https://blog.sanctum.geek.nz/series/unix-as-ide/

-- Uninstall and reinstall repo from https://github.com/01wil/nvim:
-- # Linux or MacOS (unix)
-- rm -rf ~/.config/nvim
-- rm -rf ~/.local/share/nvim

-- # Windows
-- rd -r ~\AppData\Local\nvim
-- rd -r ~\AppData\Local\nvim-data

-- Append .gitconfig to use nvim for diffs and merges (and other goodies):
-- [user]
--  name = REPLACE_PLACEHOLDER
--  email = REPLACE_PLACEHOLDER
-- [credential]
--  helper = store
-- [push]
--  autoSetupRemote = true
--  followTags = true
-- [pull]
--  rebase = true
-- [fetch]
--  prune = true
--  pruneTags = true
-- [core]
--  editor = nvim
--  autocrlf = input
-- [branch]
--  sort = -committerdate
-- [commit]
--  verbose = true
-- [diff]
--  tool = nvimdiff
--  algorithm = histogram
--  indentHeuristic = true
--  colorMoved = default
--  colorMovedWS = ignore-all-space
-- [merge]
--  tool = nvimdiff
--  conflictstyle = zdiff3
--  stat = true
-- [mergetool "vimdiff"]
--  layout = BASE,MERGED + BASE,LOCAL + BASE,REMOTE
-- [color]
--  ui = auto
-- [column]
--  ui = auto
-- [tag]
--  sort = version:refname
-- [rerere]
--  enabled = true
--  autoupdate = true
-- [help]
--  autocorrect = prompt
-- [alias]
--  st = status -sb
--  co = checkout
--  br = branch
--  rb = rebase -i HEAD~
--  d = diff --color-moved
--  df = diff --minimal
--  lg = log --graph --oneline --decorate --all
--  graph = log --graph --decorate --pretty=format:'%C(auto)%h %Cgreen%ad%Creset %C(bold blue)%an%Creset %s' --date=short
--  amend = commit --amend --no-edit
--  unstage = reset HEAD --
--  last = log -1 HEAD
--  undo = reset --soft HEAD~1
--  wipe = reset --hard HEAD
--  changes = diff HEAD~1 HEAD
