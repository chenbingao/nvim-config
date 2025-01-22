local ok, trouble = pcall(require, "trouble")

if ok then
  trouble.setup {
    win = {
      type = "float",
    },
  }
end
