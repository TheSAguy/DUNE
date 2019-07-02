
data:extend({
		

---- Liquid Melange
  {
    type = "fluid",
    name = "liquid-melange",
    max_temperature = 100,
    icon = "__Dune__/graphics/icons/liquid_melange.png",
    icon_size = 64,
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = {r = 1.000, g = 0.667, b = 0.000},
    flow_color = {r = 1.000, g = 0.667, b = 0.000},
    order = "a[fluid]-f[liquid-melange]"
  }
  
---- Solid Melange
  {
    type = "item",
    name = "solid-melange",
    icon = "__Dune__/graphics/icons/solid_melange.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "c[solid-melange]",
    stack_size = 500
  },
		
})

