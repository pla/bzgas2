local util = require("data-util");

if util.me.use_phenol() then

data:extend({
  {
    type = "item",
    name = "phenol",
    icon = "__bzgas2__/graphics/icons/phenol.png", icon_size = 128,
    pictures = {
      {filename = "__bzgas2__/graphics/icons/phenol.png",   size = 128, scale = 0.25},
      {filename = "__bzgas2__/graphics/icons/phenol-2.png", size = 128, scale = 0.25},
      {filename = "__bzgas2__/graphics/icons/phenol-3.png", size = 128, scale = 0.25},
      {filename = "__bzgas2__/graphics/icons/phenol-4.png", size = 128, scale = 0.25},
    },
    subgroup = "raw-material",
    order = "g[phenol]",
    stack_size = 100,
  },
})

if data.raw.item[mods["Krastorio2"] and "kr-coke" or "coke"] then
  local cat
  if mods.Krastorio2 then
    cat  = "smelting"
  elseif data.raw.item["foundry"] then
    cat = "founding"
  else
    cat = "advanced-crafting"
  end

  if mods.Krastorio2 then
    data:extend({
      {
        type = "recipe",
        name = "phenol",
        categories = {cat},
        main_product = "phenol",
        enabled = false,
        icon = "__bzgas2__/graphics/icons/phenol.png", icon_size = 128,
        ingredients = {{type="item", name="coal", amount=6}, {type="item", name="wood", amount=6}},
        energy_required = 16,
        subgroup = "raw-material",
        results = {
          {type="item", name="phenol", amount = 6},
          {type="item", name="kr-coke", amount = 3},
        },
      }
    })
  else
    data:extend({
      {
        type = "recipe",
        name = "phenol",
        categories = {cat},
        main_product = "phenol",
        enabled = false,
		     icon = "__bzgas2__/graphics/icons/phenol.png", icon_size = 128,
        ingredients = {{type="item", name="coal", amount=4}},
        energy_required = 6.4,
		     subgroup = "raw-material",
        results = {
          {type="item", name="phenol", amount = 2},
          {type="item", name="coke", amount = 1},
        },
      }
    })
  end
  if mods.Krastorio2 then
    util.add_effect("steel-processing", {type="unlock-recipe", recipe="phenol"})
  elseif data.raw.item["foundry"] then
    util.add_effect("foundry", {type="unlock-recipe", recipe="phenol"})
  else
    util.add_effect("basic-chemistry", {type="unlock-recipe", recipe="phenol"})
  end

  if mods.Krastorio2 then
    light_oil_icon = { icon = "__Krastorio2Assets__/icons/fluids/light-oil.png", icon_size = 64, icon_mipmaps = 4, scale=0.25, shift={-8,-8}}
  else
    light_oil_icon = { icon = "__base__/graphics/icons/fluid/light-oil.png", icon_size = 64, icon_mipmaps = 4, scale=0.25, shift={-8,-8}}
  end
  data:extend({
    {
      type = "recipe",
      name = "phenol-from-oil",
      localised_name = { "item-name.phenol" },
      main_product = "phenol",
      categories = {"chemistry"},
      enabled = false,
      icons = {
        {icon = "__bzgas2__/graphics/icons/phenol.png", icon_size = 128},
        light_oil_icon,
      },
      ingredients = {
        {type="fluid", name="light-oil", amount=20}
      },
      energy_required = 12,
      results = {
        {type="item", name="phenol", amount=3},
      },
    }
  })
  util.add_unlock("advanced-oil-processing", "phenol-from-oil")
else
  data:extend({
    {
      type = "recipe",
      name = "phenol",
      categories = {"advanced-crafting"},
      main_product = "phenol",
      enabled = false,
      energy_required = 1,
      ingredients = {{type="item", name="coal", amount=1}},
      results = {
        {type="item", name="phenol", amount=1},
      },
    }
  })
  util.add_effect("automation", {type="unlock-recipe", recipe="phenol"})
end
end
