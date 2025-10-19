-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
local util = require("data-util");
local matter = require("__Krastorio2__/prototypes/libraries/matter")

data:extend(
{
  {
    type = "technology",
    name = "gas-matter-processing",
    icons =
    {
      {
        icon = util.k2assets().."/technologies/matter-oil.png",
        icon_size = 256,
      },
      {
        icon = "__bzgas__/graphics/icons/gas.png",
        icon_size = 128,
        scale = 1.4,
      }
    },
    prerequisites = {"kr-matter-processing"},
    unit =
  	{
      count = 350,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"kr-matter-tech-card", 1}
      },
      time = 45
    }
  },
})

local gas_ore_matter = 
	{
	  material = { type = "fluid", name = "gas", amount = 100 },
	  matter_count = 5,
    energy_required = 1,
    need_stabilizer = false,
    unlocked_by_technology = "gas-matter-processing"
	}
matter.make_recipes(gas_ore_matter)
end
