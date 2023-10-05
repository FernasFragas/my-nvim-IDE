-- import telescope plugin 
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then 
  return
end

-- import telescope actions
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then 
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      ["<C-k>"] = actions.move_selection_previous, -- go to previous result
      ["<C-j>"] = actions.move_selection_next, -- got to next result
    }
  }

})
