
-- ~/.config/nvim/lua/plugins/themes.lua
-- Minimal drop-in theme switcher that is safe to leave inside plugins/ (returns a table)
-- It defines :NextTheme, <leader>nt (cycle) and <leader>th (picker).
-- It returns {} at the end so lazy.nvim treats this file as a valid spec module.

local themes = {
  "default",
  "tokyonight","gruvbox","catppuccin","kanagawa","melange","onedark",
  "nightfox","rose-pine","monokai-pro","nord","material","moonfly",
  "everforest","doom-one","ayu","edge","aurora","zephyr","oxocarbon",
  "palenight","horizon","vscode","apprentice","OceanicNext","jellybeans",
}

local index = 0

-- helper: try to set a theme name, return true on success
local function try_set(theme)
  local ok, _ = pcall(vim.cmd.colorscheme, theme)
  return ok
end

-- Cycle to next installed theme (skips missing ones)
vim.api.nvim_create_user_command("NextTheme", function()
  if #themes == 0 then
    vim.notify("No themes configured", vim.log.levels.WARN)
    return
  end

  for _ = 1, #themes do
    index = index % #themes + 1
    local theme = themes[index]
    if try_set(theme) then
      print("Switched to " .. theme)
      return
    end
    -- else skip and continue
  end

  vim.notify("No installed theme found from list", vim.log.levels.ERROR)
end, {})

-- Keymap to cycle
pcall(function()
  vim.keymap.set("n", "<leader>nt", ":NextTheme<CR>", { noremap = true, silent = true })
end)

-- Picker (use builtin vim.ui.select if available)
vim.keymap.set("n", "<leader>th", function()
  if not vim.ui or not vim.ui.select then
    vim.notify("vim.ui.select not available", vim.log.levels.ERROR)
    return
  end

  vim.ui.select(themes, { prompt = "Pick a theme:" }, function(choice)
    if not choice then return end
    if try_set(choice) then
      print("Theme set to " .. choice)
    else
      vim.notify("Theme '" .. choice .. "' not found/installed", vim.log.levels.ERROR)
    end
  end)
end, { noremap = true, silent = true })

-- Return an EMPTY table so lazy.nvim treats this file as a valid plugin spec module.
-- (This avoids the "Expected a table of specs, but a nil was returned" error.)
return {}

