return {
  "HakonHarnes/img-clip.nvim",
  keys = {
    {
      "<leader>P",
      function()
        require("img-clip").paste_image({}, vim.fn.expand("~/.cache/img-inbox.png"))
      end,
      desc = "Paste image from inbox at ~/.cache/img-inbox.png. Pairs with shot.sh on remote",
    },
  },
  opts = {
    default = {
      dir_path = "attachments",
      relative_to_current_file = true,
      copy_images = true,
    },
  },
}
