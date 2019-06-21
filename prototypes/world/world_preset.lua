
--**************************************************************
--
--	Creating the Dune World
--
--**************************************************************

require ("util")



--- World Pre-set
data.raw['map-gen-presets'].default['er:DUNE'] = {
    order = 'h',
      basic_settings =
      {
        property_expression_names = {},
		autoplace_controls =
        {
          coal =
          {
            frequency = 0.33333333333,
          },
          ["copper-ore"] =
          {
            frequency = 0.33333333333,
          },
          ["crude-oil"] =
          {
            frequency = 0.33333333333,
          },
          ["uranium-ore"] =
          {
            frequency = 0.15,
          },
          ["iron-ore"] =
          {
            frequency = 0.33333333333,
          },
          stone =
          {
            frequency = 0.5,
          },
		  ["enemy-base"] = { frequency = "very-high", size = "very-big"},
        },		
        water = 0.00,
        starting_area = "medium",
      },
      advanced_settings =
      {
        difficulty_settings =
        {
          recipe_difficulty = defines.difficulty_settings.recipe_difficulty.expensive,
          technology_difficulty = defines.difficulty_settings.technology_difficulty.expensive,
        },  
        enemy_evolution =
        {
          time_factor = 0.00004,
          pollution_factor = 0.0000012
        },
      },
    }

	
  -- moisture and terrain type
local property_expression_names_mine = {}
property_expression_names_mine["control-setting:moisture:bias"] = -0.5
property_expression_names_mine["control-setting:aux:bias"] = -0.5

  -- cliffs
local cliff_settings_mine = {}
cliff_settings_mine.name = "cliff"
cliff_settings_mine.cliff_elevation_interval = -0.25
cliff_settings_mine.richness = 6


data.raw["map-gen-presets"].default['er:DUNE'].basic_settings.property_expression_names = property_expression_names_mine
data.raw["map-gen-presets"].default['er:DUNE'].basic_settings.cliff_settings = cliff_settings_mine


--[[
map_sets =
{
  map_set_entities =
  {

  ["red-chest"] =
  {
    {position = {-1.5, -52.5}, force = "player", direction = 0},
    {position = {1.5, -52.5}, force = "player", direction = 0},
    {position = {-1.5, 52.5}, force = "player", direction = 0},
    {position = {1.5, 52.5}, force = "player", direction = 0}
  },
  }

}	]]