 return {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>rf", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  }
