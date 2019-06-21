require ("util")



local dune_palm_tree = util.table.deepcopy(data.raw.tree["tree-01"])
dune_palm_tree.name = "dune-palm-tree"
dune_palm_tree.icon = "__Dune__/graphics/icons/palm.png"
dune_palm_tree.icon_size = 64
dune_palm_tree.order = order = "a[tree]-a[regular]-a[dune-palm-tree]" 
dune_palm_tree.max_health = 65
dune_palm_tree.corpse = "big-remnants"
dune_palm_tree.dying_explosion = "medium-explosion"
dune_palm_tree.collision_box = {{-2.8, -2.8}, {2.8, 2.8}}
dune_palm_tree.selection_box = {{-3, -3}, {3, 3}}
dune_palm_tree.picture =
    {
      filename = "__Dune__/graphics/entities/giga_wooden_chest.png",
      priority = "extra-high",
      width = 501,
      height = 366,
      shift = {0.88, -0.170},
	  scale = 0.5,
    }

data:extend({dune_palm_tree})
