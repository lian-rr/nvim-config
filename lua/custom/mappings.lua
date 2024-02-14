local M = {}

M.disable = {
    ["Q"] = { "<nop>", "nop" },
}

M.custom = {
  n = {
    ["J"] = { "mzJ`z", "Join lines" },

    ["<C-d>"] = { "<C-d>zz", "Half-page down" },
    ["<C-u>"] = { "<C-u>zz", "Half-page up" },

    ["n"] = { "nzzzv", "Next search term" },
    ["N"] = { "Nzzzv", "Previous search term" },

    ["<leader>ss"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace all"},
    ["<leader>sc"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], "Replace with confirmation" },

    ["<leader>i"] = {
      function ()
        local bufnr,_ = vim.diagnostic.open_float()
        vim.api.nvim_buf_set_option(bufnr, 'filetype', vim.o.filetype)
      end,
      "Open diagnostic"
    },
  },
  i = {
    -- not working 
    ["<C-,>"] = { "<ESC>", "Escape insert mode", opts = { nowait = true } }
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug last go test"
    }
  }
}

return M
