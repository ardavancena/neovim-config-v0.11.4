
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 🔹 Diagnostics setup
      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          spacing = 2,
          source = "if_many",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Floating window diagnostics
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
        end,
      })

      -- 🔹 Servers list
      local servers = {
          "ts_ls",
          "solargraph",
          "html",
          "lua_ls",
          "cmake",
          "asm_lsp",
          "pyright",
          "bashls",
          "cssls",
          "vimls",
          "clangd",
      }

      for _, server in ipairs(servers) do
          vim.lsp.config(server, {  -- ✅ new API
              capabilities = capabilities,
          })
      end

      -- 🔹 Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

