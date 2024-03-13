return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      { "<leader>xR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Show [R]eferences" },
    }
  },
}
