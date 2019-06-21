require ("util")


data:extend({

	  
  {
    type = "mining-drill",
    name = "dune-pumpjack",
    icon = "__Dune__/graphics/icons/basic_pumpjack.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.4, result = "dune-pumpjack"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    dying_explosion = "medium-explosion",
    corpse = "pumpjack-remnants",
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
		{
		  type = "burner",
		  fuel_category = "chemical",
		  effectivity = 1,
		  fuel_inventory_size = 1,
		  emissions_per_minute = 5,
		  smoke =
		  {
			{
			  name = "smoke",
			  deviation = {0.1, 0.1},
			  frequency = 5
			}
		  }
		},
    output_fluid_box =
    {
      base_area = 1,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
        }
      }
    },
    energy_usage = "180kW",
    mining_speed = 0.85,
	mining_power = 2,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_specification =
    {
      module_slots = 2
    },
	radius_visualisation_picture =
		{
		  filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
		  width = 12,
		  height = 12
		},
		monitor_visualization_tint = {r=78, g=173, b=255},
		base_render_layer = "lower-object-above-shadow",
		base_picture =
		{
		  sheets =
		  {
			{
			  filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
			  priority = "extra-high",
			  tint = {r = 0.4, g = 0.4, b = 0.4},
			  width = 131,
			  height = 137,
			  shift = util.by_pixel(-2.5, -4.5),
			  hr_version = 
			  {
				filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
				priority = "extra-high",
				tint = {r = 0.4, g = 0.4, b = 0.4},
				width = 261,
				height = 273,
				shift = util.by_pixel(-2.25, -4.75),
				scale = 0.5
			  }
			},
			{
			  filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
			  priority = "extra-high",
			  width = 110,
			  height = 111,
			  draw_as_shadow = true,
			  shift = util.by_pixel(6, 0.5),
			  hr_version =
			  {
				filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base-shadow.png",
				width = 220,
				height = 220,
				scale = 0.5,
				draw_as_shadow = true,
				shift = util.by_pixel(6, 0.5)
			  }
			}
		  }
		},
		animations =
		{
		  north =
		  {
			layers = 
			{
			  {
				priority = "high",
				filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
				tint = {r = 0.4, g = 0.4, b = 0.4},
				line_length = 8,
				width = 104,
				height = 102,
				frame_count = 40,
				shift = util.by_pixel(-4, -24),
				animation_speed = 0.5,
				hr_version = 
				{
				  priority = "high",
				  filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead.png",
				  tint = {r = 0.4, g = 0.4, b = 0.4},
				  animation_speed = 0.5,
				  scale = 0.5,
				  line_length = 8,
				  width = 206,
				  height = 202,
				  frame_count = 40,
				  shift = util.by_pixel(-4, -24)
				}
			  },
			  {
				priority = "high",
				filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
				tint = {r = 0.4, g = 0.4, b = 0.4},
				animation_speed = 0.5,
				draw_as_shadow = true,
				line_length = 8,
				width = 155,
				height = 41,
				frame_count = 40,
				shift = util.by_pixel(17.5, 14.5),
				hr_version = 
				{
				  priority = "high",
				  filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead-shadow.png",
				  tint = {r = 0.4, g = 0.4, b = 0.4},
				  animation_speed = 0.5,
				  draw_as_shadow = true,
				  line_length = 8,
				  width = 309,
				  height = 82,
				  frame_count = 40,
				  scale = 0.5,
				  shift = util.by_pixel(17.75, 14.5)
				}
			  }
			}
		  }
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  sound = { filename = "__base__/sound/pumpjack.ogg" },
		  apparent_volume = 1.25,
		},
		fast_replaceable_group = "pumpjack",
		
		circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
		circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance
	  },
	  
	 
	 })

