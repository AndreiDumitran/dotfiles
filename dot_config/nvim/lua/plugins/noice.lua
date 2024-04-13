return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
        bottom_search = false,
        inc_rename = true,
      },
      lsp = {
        hover = {
          silent = true,
        },
        signature = {
          enabled = false,
        },
      },
    },
  },
}
