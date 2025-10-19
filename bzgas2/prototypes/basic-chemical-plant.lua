local util = require("data-util");
local futil = require("util");

data:extend({
  {
    type = "recipe",
    name = "basic-chemical-plant",
    results = {{ type = "item", name = "basic-chemical-plant", amount = 1}},
    enabled = false,
    ingredients = {
      {type="item", name="stone-brick", amount=5},
      {type="item", name="iron-plate", amount=4},
      {type="item", name="copper-plate", amount=4},
      {type="item", name="pipe", amount=6},
    },
  }
})

util.add_ingredient("basic-chemical-plant", "lead-plate", 4)
util.replace_ingredient("basic-chemical-plant", "iron-plate", "aluminum-plate")
util.replace_ingredient("basic-chemical-plant", "copper-plate", "tin-plate")
util.replace_ingredient("basic-chemical-plant", "stone-brick", mods["Krastorio2"] and "kr-sand" or "sand", 10)
util.replace_ingredient("basic-chemical-plant", "stone-brick", "silica", 10)

-- item
local plant_i = futil.table.deepcopy(data.raw.item["chemical-plant"])
plant_i.name = "basic-chemical-plant"
plant_i.place_result = "basic-chemical-plant"
plant_i.icon = nil
plant_i.icon_size = nil
plant_i.icon_mipmaps = nil
plant_i.icons = {
  {icon="__base__/graphics/icons/chemical-plant.png", icon_size=64},
  {icon="__bzgas2__/graphics/icons/chemical-plant-overlay.png", icon_size=64},
}

data.raw.item["basic-chemical-plant"] = plant_i
-- end item

-- Replaceable group
if not data.raw["assembling-machine"]["chemical-plant"].fast_replaceable_group then
  data.raw["assembling-machine"]["chemical-plant"].fast_replaceable_group = "chemical-plant"
end
-- entity
local plant_e = futil.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
plant_e.name = "basic-chemical-plant"
plant_e.minable = {mining_time = 0.5, result = "basic-chemical-plant"}
plant_e.module_slots = 0
plant_e.graphics_set.working_visualisations = {plant_e.graphics_set.working_visualisations[1], plant_e.graphics_set.working_visualisations[2]} -- no smoke
plant_e.graphics_set.animation.north.layers[1].filename="__bzgas2__/graphics/entity/hr-chemical-plant.png"
plant_e.graphics_set.animation.south.layers[1].filename="__bzgas2__/graphics/entity/hr-chemical-plant.png"
plant_e.graphics_set.animation.east.layers[1].filename="__bzgas2__/graphics/entity/hr-chemical-plant.png"
plant_e.graphics_set.animation.west.layers[1].filename="__bzgas2__/graphics/entity/hr-chemical-plant.png"
plant_e.next_upgrade="chemical-plant"
plant_e.icon = nil
plant_e.icon_size = nil
plant_e.icon_mipmaps = nil
plant_e.icons = {
  {icon="__base__/graphics/icons/chemical-plant.png", icon_size=64},
  {icon="__bzgas2__/graphics/icons/chemical-plant-overlay.png", icon_size=64},
}

plant_e.energy_source = {
  type = "burner",
  fuel_inventory_size = 1,
  effectivity = 1,
  emissions_per_minute = { pollution = 5 },
  fuel_categories = {"chemical"},
  smoke = {
    {
      name = "smoke",
      frequency = 30,
      north_position = {-0.43, -2.3},
      south_position = {0.23, -1.9},
      east_position  = {0.5, -2.15},
      west_position  = {-0.45, -2.0},
      starting_vertical_speed = 0.1,
      starting_frame_deviation = 60,
    },
  },
}
data.raw["assembling-machine"]["basic-chemical-plant"] = plant_e
-- end entity
