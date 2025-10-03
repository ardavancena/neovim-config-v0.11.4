return {
  "MeanderingProgrammer/markdown.nvim",
  ft = { "markdown" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    latex = { enabled = true }, -- Enable LaTeX math rendering
    heading = { enabled = true }, -- Pretty headings
    checkbox = { enabled = true }, -- GitHub-style checkboxes
    code = { enabled = true }, -- Highlight code blocks
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)

    -- Toggle render with <F5>
    vim.keymap.set("n", "<leader>mp", function()
      require("render-markdown").toggle()
    end, { desc = "Toggle Markdown Render" })
  end,
}

