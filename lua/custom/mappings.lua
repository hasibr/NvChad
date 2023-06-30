local M = {}

-- Leader + tr while in normal mode to toggle transparency in vim
M.transparency = {
  n = {
    ["<leader>tr"] = {
      -- Toggle transparency for Nvim
      function()
        require("base46").toggle_transparency()
      end,
      -- Toggle transparency for Nvim Tree (turn background off)
      NvimTreeNormal = {
        bg = "none",
      },
      "Toggle transparency",
    }
  }
}

return M

