require("neotest").setup {
  adapters = {
    require "neotest-python" {
      dap = { justMyCode = false },
    },
    require "neotest-plenary",
    require "neotest-zig" {
      dap = {
        adapter = "lldb",
      },
    },
    require "rustaceanvim.neotest",
  },
}
