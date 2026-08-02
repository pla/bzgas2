local resource_autoplace = require('resource-autoplace');

local util = require("data-util");
local futil = require("util")

data.raw.planet.nauvis.map_gen_settings.autoplace_controls["gas"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["gas"] = {}
resource_autoplace.initialize_patch_set("gas", true)

data:extend({ {type = "resource-category", name="gas"} })
data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "gas",
    richness = true,
    order = "b-ez"
	},
  {
    type = "resource",
    name = "gas",
    icon =  "__bzgas2__/graphics/icons/gas.png",
    icon_size = 128,
    flags = {"placeable-neutral"},
    category = "gas",
    subgroup = "raw-resource",
    order="a-b-a",
    infinite = true,
    highlight = true,
    minimum = 60000,
    normal = 300000,
    infinite_depletion_amount = 10,
    resource_patch_search_radius = 12,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "fluid",
          name = "gas",
          amount_min = 10,
          amount_max = 10,
          independent_probability = 1
        }
      }
    },
    -- walking_sound = sounds.oil,
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    map_color = {0.9, 0.75, 0.2},
    map_grid = false,
    autoplace = resource_autoplace.resource_autoplace_settings(
    {
      name = "gas",
      order = "c-g",
      base_density = 8.2,
      base_spots_per_km2 = 1.8,
      random_probability = 1/48,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 1,
      additional_richness = 220000,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1,
    }),
    stage_counts = {0},
    stages =
    {
      sheet =
      {
        filename = "__bzgas2__/graphics/entity/ores/hr-gas.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 4,
        variation_count = 1,
        shift = futil.by_pixel(0, -12),
        scale = 0.5*0.75,
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__bzgas2__/graphics/entity/ores/hr-gas-effect.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 4,
        variation_count = 1,
        shift = futil.by_pixel(0, -17),
        blend_mode = "normal",
        scale = 0.5*0.75,
      }
    },
    effect_animation_period = 3.5,
    effect_animation_period_deviation = 1.5,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.1,
    max_effect_alpha = 0.9,
  },
  {
    type = "fluid",
    name = "gas",
    default_temperature = 25,
    heat_capacity = "0.1kJ",
    fuel_value = "1000kJ",
    emissions_multiplier = util.se6() and 1.1 or 0.75,
    base_color = {r=0.67, g=0.87, b=0.77},
    flow_color = {r=0.67, g=0.87, b=0.87},
    icon =  "__bzgas2__/graphics/icons/gas.png",
    icon_size = 128,
    order = "a[fluid]-f[gas]"
  },
})
if util.me.finite() then
  data.raw.resource["gas"].infinite = false
  data.raw.resource["gas"].minimum = 20000
  data.raw.resource["gas"].normal = 80000
  data.raw.resource["gas"].minable = {
    mining_time = 1,
    results = {
      {
        type = "fluid",
        name = "gas",
        amount_min = 20,
        amount_max = 20,
        independent_probability = 1,
      },
    },
  }
end
