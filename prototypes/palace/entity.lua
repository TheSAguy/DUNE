

local dune_palace = util.table.deepcopy(data.raw["logistic-container"]["logistic-chest-passive-provider"])
dune_palace.name = "dune-palace"
dune_palace.icon = "__Dune__/graphics/icons/dune_palace_icon.png"
dune_palace.icon_size = 64
dune_palace.scale_info_icons = true
dune_palace.order = "dune-palace"
dune_palace.minable = nil
dune_palace.type = "container"
dune_palace.max_health = 1000
dune_palace.corpse = "big-remnants"
dune_palace.dying_explosion = "medium-explosion"
dune_palace.collision_box = {{-2.8, -2.8}, {2.8, 2.8}}
dune_palace.selection_box = {{-3, -3}, {3, 3}}
dune_palace.picture =
    {
      filename = "__Dune__/graphics/entities/dune_palace_large.png",
      priority = "extra-high",
      width = 448,
      height = 448,
      --shift = {0.88, -0.170},
	  scale = 0.5,
    }

data:extend({dune_palace})
