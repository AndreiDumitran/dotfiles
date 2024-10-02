return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/nvim-nio", 'adrigzr/neotest-mocha' },
  opts = {
    adapters = {
      ["neotest-mocha"] = {
        neotest_command = "yarn test",
        neotest_args = { "--watchAll=false" },
        dap_enabled = true,
      },
    },
    -- adapters = {
    --   ["neotest-golang"] = {
    --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
    --     dap_go_enabled = true,
    --   },
    -- },
  },
}
