
data:extend({

  {
    type = "recipe",
    name = "melange-liquefaction",
    icon = "__Dune__/graphics/icons/melange-liquefaction.png",
    icon_size = 64, 
	category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="item", name="melange", amount=10},
      {type="fluid", name="water", amount=50}
    },
    results=
    {
      {type="fluid", name="liquid-melange", amount=80},
    },
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },
  

  {
    type = "recipe",
    name = "solid-melange", 
    icon = "__Dune__/graphics/icons/solid_melange.png",
    icon_size = 64,
	category = "chemistry",
    energy_required = 2,
    ingredients =
    {
      {type="fluid", name="liquid-melange", amount=10},
	  {type="fluid", name="steam", amount=50},
    },
    results=
    {
      {type="item", name="solid-melange", amount=1}
    },
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]",
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.667, b = 0.000, a = 0.000}, 
      secondary = {r = 1.000, g = 0.667, b = 0.000, a = 0.000}, 
      tertiary = {r = 1.000, g = 0.667, b = 0.000, a = 0.000}, 
    }
	
  },


})

