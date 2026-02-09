require("xcodebuild").setup {
  auto_save = false,
  integrations = {
    xcodebuild_offline = {
      enabled = true,
    },
  },
}
