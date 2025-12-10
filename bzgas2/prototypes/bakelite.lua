local util = require("data-util");

local prereq = {"basic-chemistry"}
if mods["Krastorio2"] then
  table.insert(prereq, "steel-processing")
elseif util.is_foundry() then
  table.insert(prereq, "foundry")
elseif mods["aai-industry"] then
  table.insert(prereq, "automation")
end

data:extend({
  {
    type = "item",
    name = "bakelite",
    icon = "__bzgas2__/graphics/icons/bakelite.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "g[bakelite]",
    stack_size = 100,
  },
  {
    type = "recipe",
    name = "bakelite",
    category = "chemistry",
    main_product = "bakelite",
    enabled = false,
    ingredients = {
      {type = "item", name = util.me.use_phenol() and "phenol" or "coal", amount = 1},
      {type="fluid", name="formaldehyde", amount=10}
    },
    energy_required = 2,
    results = {
      {type="item", name="bakelite", amount = 2},
    },
  },
  {
    type = "technology",
    name = "bakelite",
    icon = "__bzgas2__/graphics/technology/bakelite.png",
    icon_size = 256,
    prerequisites = prereq,
    effects = {
      {type = "unlock-recipe", recipe = "bakelite"},
    },
    unit = {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 20,
    },
  },
})

util.add_prerequisite("electronics", "bakelite")
