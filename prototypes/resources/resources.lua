

data:extend({
			
	{
		type = "autoplace-control",
		name = "ground-water",
		richness = true,
		order = "z-59",
		category = "resource"
	},

	{
		type = "noise-layer",
		name = "ground-water"
	},

	{
		type = "resource",
		name = "ground-water",
		icon = "__base__/graphics/icons/fluid/water.png",
		icon_size = 32,
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		order = "a",
		infinite = false,
		highlight = true,
		starting = {richness=800, size=4, probability=1},
		minimum = 60000,
		normal = 200000,
		infinite_depletion_amount = 10,
		resource_patch_search_radius = 12,
		tree_removal_probability = 0,
		tree_removal_max_distance = 16 * 16,
		minable =
		{
			hardness = 1,
			mining_time = 1,
			results =
				{
					{
					type = "fluid",
					name = "water",
					amount_min = 20,
					amount_max = 20,
					probability = 1
					}
				}
		},
	    collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ground-water",
			order = "z-59",
			base_density = 6,
			base_spots_per_km2 = 1.25,
			random_probability = 2/48,
			random_spot_size_minimum = 1,
			random_spot_size_maximum = 2, 
			additional_richness = 100000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
			has_starting_area_placement = true,
			--resource_index = resource_autoplace.get_next_resource_index() + 10,
			regular_rq_factor_multiplier = 1,
			--starting_rq_factor_multiplier = 5
		},
		stage_counts = {0},
		stages =
		{
		sheet =
			{
				filename = "__Dune__/graphics/resources/fresh-water.png",
				priority = "extra-high",
				width = 75,
				height = 61,
				frame_count = 4,
				variation_count = 1
			}
		},
		map_color = {r=0, g=0, b=0.8},
		map_grid = false
	},


})



data:extend({

			
	{
		type = "autoplace-control",
		name = "melange",
		richness = true,
		order = "b",
		category = "resource"
	},

	{
		type = "noise-layer",
		name = "melange"
	},

	{
    type = "resource",
    name = "melange",
    icon = "__Dune__/graphics/icons/melange.png",
    icon_size = 64,
    flags = {"placeable-neutral"},
    order="b",
    tree_removal_probability = 1,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 1.5,
      result = "melange",
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "melange",
      order = "b",
      base_spots_per_km2 = 1.25,
      has_starting_area_placement = true,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 2,
      --resource_index = resource_autoplace.get_next_resource_index() + 15,
      base_density = 1.5,
      regular_rq_factor_multiplier = 1.1,
      starting_rq_factor_multiplier = 2
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
	--stage_counts = {20000, 10000, 7000, 4000, 2000, 1000, 350, 100},
    stages =
    {
      sheet =
      {
        filename = "__Dune__/graphics/resources/melange-ore.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        hr_version =
        {
          filename = "__Dune__/graphics/resources/hr-melange-ore.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5
        }
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__Dune__/graphics/resources/melange-ore-glow.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        frame_count = 8,
        variation_count = 8,
        blend_mode = "additive",
        flags = {"light"},
        hr_version =
        {
          filename = "__Dune__/graphics/resources/hr-melange-ore-glow.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          frame_count = 8,
          variation_count = 8,
          scale = 0.5,
          blend_mode = "additive",
          flags = {"light"}
        }
      }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = {r=1, g=170/255, b=0}
  },
  
  

}
) 
