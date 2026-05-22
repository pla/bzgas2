-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("data-util");

local icon = {
    icon = "__bzgas2__/graphics/icons/gas.png",
    icon_size = 128,
    scale = 1.4,
  }

local gas_ore_matter = 
	{
	  material = { type = "fluid", name = "gas", amount = 100 },
	  matter_count = 5,
    energy_required = 1,
    needs_stabilizer = false,
    unlocked_by = "gas-matter-processing"
	}
util.k2matter({k2matter = gas_ore_matter, icon = icon})
end
