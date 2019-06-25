
--**************************************************************
--
--	Creating the Dune World
--
--**************************************************************

require ("util")

-- Vanilla Tiles to Remove (True = Remove)
-- Can't just remove water from the game, it will crash
game_tiles = {
	["grass-1"] = true,
	["grass-2"] = true,
	["grass-3"] = true,
	["grass-4"] = true,
	["dirt-1"] = true,
	["dirt-2"] = true,
	["dirt-3"] = true,
	["dirt-4"] = true,
	["dirt-5"] = true,
	["dirt-6"] = true,
	["dirt-7"] = true,
	["dry-dirt"] = true,
	["red-desert-0"] = true,
	["red-desert-1"] = false,
	["red-desert-2"] = false,
	["red-desert-3"] = false,
	["water-green"] = true,
	["water"] = false,
	["water-mud"] = false,
	["water-shallow"] = false,
	["deepwater"] = true,
	["deepwater-green"] = true,
	["sand-1"] = false, 
	["sand-2"] = false,
	["sand-3"] = false,
	["mineral-purple-dirt-1"] = true,
	["mineral-purple-dirt-2"] = true,
	["mineral-purple-dirt-3"] = true,
	["mineral-purple-dirt-4"] = true,
	["mineral-purple-dirt-5"] = true,
	["mineral-purple-dirt-6"] = true,
	["mineral-purple-sand-1"] = true,
	["mineral-purple-sand-2"] = true,
	["mineral-purple-sand-3"] = true,
	["mineral-violet-dirt-1"] = true,
	["mineral-violet-dirt-2"] = true,
	["mineral-violet-dirt-3"] = true,
	["mineral-violet-dirt-4"] = true,
	["mineral-violet-dirt-5"] = true,
	["mineral-violet-dirt-6"] = true,
	["mineral-violet-sand-1"] = true,
	["mineral-violet-sand-2"] = true,
	["mineral-violet-sand-3"] = true,
	["mineral-red-dirt-1"] = true,
	["mineral-red-dirt-2"] = true,
	["mineral-red-dirt-3"] = true,
	["mineral-red-dirt-4"] = true,
	["mineral-red-dirt-5"] = true,
	["mineral-red-dirt-6"] = true,
	["mineral-red-sand-1"] = true,
	["mineral-red-sand-2"] = true,
	["mineral-red-sand-3"] = true,
	["mineral-brown-dirt-1"] = true,
	["mineral-brown-dirt-2"] = true,
	["mineral-brown-dirt-3"] = true,
	["mineral-brown-dirt-4"] = true,
	["mineral-brown-dirt-5"] = true,
	["mineral-brown-dirt-6"] = true,
	["mineral-brown-sand-1"] = false,
	["mineral-brown-sand-2"] = false,
	["mineral-brown-sand-3"] = false,
	["mineral-tan-dirt-1"] = true,
	["mineral-tan-dirt-2"] = true,
	["mineral-tan-dirt-3"] = true,
	["mineral-tan-dirt-4"] = true,
	["mineral-tan-dirt-5"] = true,
	["mineral-tan-dirt-6"] = true,
	["mineral-tan-sand-1"] = false,
	["mineral-tan-sand-2"] = false,
	["mineral-tan-sand-3"] = false,
	["mineral-aubergine-dirt-1"] = true,
	["mineral-aubergine-dirt-2"] = true,
	["mineral-aubergine-dirt-3"] = true,
	["mineral-aubergine-dirt-4"] = true,
	["mineral-aubergine-dirt-5"] = true,
	["mineral-aubergine-dirt-6"] = true,
	["mineral-aubergine-sand-1"] = true,
	["mineral-aubergine-sand-2"] = true,
	["mineral-aubergine-sand-3"] = true,
	["mineral-dustyrose-dirt-1"] = true,
	["mineral-dustyrose-dirt-2"] = true,
	["mineral-dustyrose-dirt-3"] = true,
	["mineral-dustyrose-dirt-4"] = true,
	["mineral-dustyrose-dirt-5"] = true,
	["mineral-dustyrose-dirt-6"] = true,
	["mineral-dustyrose-sand-1"] = true,
	["mineral-dustyrose-sand-2"] = true,
	["mineral-dustyrose-sand-3"] = true,
	["mineral-beige-dirt-1"] = true,
	["mineral-beige-dirt-2"] = true,
	["mineral-beige-dirt-3"] = true,
	["mineral-beige-dirt-4"] = true,
	["mineral-beige-dirt-5"] = true,
	["mineral-beige-dirt-6"] = true,
	["mineral-beige-sand-1"] = false,
	["mineral-beige-sand-2"] = false,
	["mineral-beige-sand-3"] = false,
	["mineral-cream-dirt-1"] = true,
	["mineral-cream-dirt-2"] = true,
	["mineral-cream-dirt-3"] = true,
	["mineral-cream-dirt-4"] = true,
	["mineral-cream-dirt-5"] = true,
	["mineral-cream-dirt-6"] = true,
	["mineral-cream-sand-1"] = false,
	["mineral-cream-sand-2"] = false,
	["mineral-cream-sand-3"] = false,
	["mineral-black-dirt-1"] = true,
	["mineral-black-dirt-2"] = true,
	["mineral-black-dirt-3"] = true,
	["mineral-black-dirt-4"] = true,
	["mineral-black-dirt-5"] = true,
	["mineral-black-dirt-6"] = true,
	["mineral-black-sand-1"] = true,
	["mineral-black-sand-2"] = true,
	["mineral-black-sand-3"] = true,
	["mineral-grey-dirt-1"] = true,
	["mineral-grey-dirt-2"] = true,
	["mineral-grey-dirt-3"] = true,
	["mineral-grey-dirt-4"] = true,
	["mineral-grey-dirt-5"] = true,
	["mineral-grey-dirt-6"] = true,
	["mineral-grey-sand-1"] = true,
	["mineral-grey-sand-2"] = true,
	["mineral-grey-sand-3"] = true,
	["mineral-white-dirt-1"] = true,
	["mineral-white-dirt-2"] = true,
	["mineral-white-dirt-3"] = true,
	["mineral-white-dirt-4"] = true,
	["mineral-white-dirt-5"] = true,
	["mineral-white-dirt-6"] = true,
	["mineral-white-sand-1"] = true,
	["mineral-white-sand-2"] = true,
	["mineral-white-sand-3"] = true,
	["vegetation-turquoise-grass-1"] = true,
	["vegetation-turquoise-grass-2"] = true,
	["vegetation-green-grass-1"] = true,
	["vegetation-green-grass-2"] = true,
	["vegetation-green-grass-3"] = true,
	["vegetation-green-grass-4"] = true,
	["vegetation-olive-grass-1"] = true,
	["vegetation-olive-grass-2"] = true,
	["vegetation-yellow-grass-1"] = true,
	["vegetation-yellow-grass-2"] = true,
	["vegetation-orange-grass-1"] = true,
	["vegetation-orange-grass-2"] = true,
	["vegetation-red-grass-1"] = true,
	["vegetation-red-grass-2"] = true,
	["vegetation-violet-grass-1"] = true,
	["vegetation-violet-grass-2"] = true,
	["vegetation-purple-grass-1"] = true,
	["vegetation-purple-grass-2"] = true,
	["vegetation-mauve-grass-1"] = true,
	["vegetation-mauve-grass-2"] = true,
	["vegetation-blue-grass-1"] = true,
	["vegetation-blue-grass-2"] = true,
	["volcanic-orange-heat-1"] = true,
	["volcanic-orange-heat-2"] = true,
	["volcanic-orange-heat-3"] = true,
	["volcanic-orange-heat-4"] = true,
	["volcanic-green-heat-1"] = true,
	["volcanic-green-heat-2"] = true,
	["volcanic-green-heat-3"] = true,
	["volcanic-green-heat-4"] = true,
	["volcanic-blue-heat-1"] = true,
	["volcanic-blue-heat-2"] = true,
	["volcanic-blue-heat-3"] = true,
	["volcanic-blue-heat-4"] = true,
	["volcanic-purple-heat-1"] = true,
	["volcanic-purple-heat-2"] = true,
	["volcanic-purple-heat-3"] = true,
	["volcanic-purple-heat-4"] = true,
	["frozen-snow-0"] = true,
	["frozen-snow-1"] = true,
	["frozen-snow-2"] = true,
	["frozen-snow-3"] = true,
	["frozen-snow-4"] = true,
	["frozen-snow-5"] = true,
	["frozen-snow-6"] = true,
	["frozen-snow-7"] = true,
	["frozen-snow-8"] = true,
	["frozen-snow-9"] = true

		
}

-- Vanilla Trees to Remove (True = Remove)
game_trees = {
	["tree-01"] = true,
	["tree-02"] = true,
	["tree-02-red"] = true,
	["tree-03"] = true,
	["tree-04"] = true,
	["tree-05"] = true,
	["tree-06"] = false,
	["tree-06-brown"] = false,
	["tree-07"] = true,
	["tree-08"] = true,
	["tree-08-brown"] = true,
	["tree-08-red"] = false,
	["tree-09"] = true,
	["tree-09-brown"] = true,
	["tree-09-red"] = false,
	--Alien Biomes
	["tree-wetland-a"] = true,
	["tree-wetland-b"] = true,
	["tree-wetland-c"] = true,
	["tree-wetland-d"] = true,
	["tree-wetland-e"] = true,
	["tree-wetland-f"] = true,
	["tree-wetland-g"] = true,
	["tree-wetland-h"] = true,
	["tree-wetland-i"] = true,
	["tree-wetland-j"] = true,
	["tree-wetland-k"] = true,
	["tree-wetland-l"] = true,
	["tree-wetland-m"] = true,
	["tree-wetland-n"] = true,
	["tree-wetland-o"] = true,
	["tree-grassland-a"] = true,
	["tree-grassland-b"] = true,
	["tree-grassland-c"] = true,
	["tree-grassland-d"] = true,
	["tree-grassland-e"] = true,
	["tree-grassland-f"] = true,
	["tree-grassland-g"] = true,
	["tree-grassland-h"] = true,
	["tree-grassland-h2"] = true,
	["tree-grassland-h3"] = true,
	["tree-grassland-i"] = true,
	["tree-grassland-j"] = true,
	["tree-grassland-k"] = true,
	["tree-grassland-l"] = true,
	["tree-grassland-m"] = true,
	["tree-grassland-n"] = true,
	["tree-grassland-o"] = true,
	["tree-grassland-p"] = true,
	["tree-grassland-q"] = true,
	["tree-dryland-a"] = true,
	["tree-dryland-b"] = true,
	["tree-dryland-c"] = true,
	["tree-dryland-d"] = true,
	["tree-dryland-e"] = true,
	["tree-dryland-f"] = true,
	["tree-dryland-g"] = true,
	["tree-dryland-h"] = true,
	["tree-dryland-i"] = true,
	["tree-dryland-j"] = true,
	["tree-dryland-k"] = true,
	["tree-dryland-l"] = true,
	["tree-dryland-m"] = true,
	["tree-dryland-n"] = true,
	["tree-dryland-o"] = true,
	["tree-desert-a"] = true,
	["tree-desert-b"] = true,
	["tree-desert-c"] = false,
	["tree-desert-d"] = true,
	["tree-desert-e"] = true,
	["tree-desert-f"] = true,
	["tree-desert-g"] = false,
	["tree-desert-h"] = true,
	["tree-desert-i"] = true,
	["tree-desert-j"] = true,
	["tree-desert-k"] = true,
	["tree-desert-l"] = true,
	["tree-desert-m"] = true,
	["tree-desert-n"] = true,
	["tree-snow-a"] = true,
	["tree-volcanic-a"] = true,
	["tree-palm-a"] = false,
	["tree-palm-b"] = true

	

}

--- Vanilla water tiles
water_tile_type_names = { 
	"water", 
	"deepwater", 
	"water-green", 
	"deepwater-green", 
	"water-shallow", 
	"water-mud" 
}

--- Vanilla floor tiles
vanilla_floor_tile_names = { 
	["refined-hazard-concrete-right"] = true, 
	["refined-hazard-concrete-left"] = true, 
	["refined-concrete"] = true, 
	["hazard-concrete-right"] = true, 
	["hazard-concrete-left"] = true, 
	["concrete"] = true,
	["stone-path"] = true
}


local function remove_from_transitions(remove_tile)
	for _, tile in pairs(data.raw.tile) do
	--log("DUNE Tile: "..tile.name)  
		if tile.transitions then
			for _, transition in pairs(tile.transitions) do
				if transition.to_tiles then
				for _, to_tile in pairs(transition.to_tiles) do
					if to_tile == remove_tile then
					transition.to_tiles[_] = nil
					end
				end
				end
			end
		end
		if tile.next_direction == remove_tile then
		  tile.next_direction = nil
		end
	end
end


local function remove_tile(tile_name)
	--data.raw.tile[tile_name] = nil
	data.raw.tile[tile_name].autoplace = nil -- a little more Mod friendly
	remove_from_transitions(tile_name)
end


local disable_non_desert_tiles = function()
	for _, tile_name in pairs(data.raw["tile"]) do
		if game_tiles[tile_name.name] then
			remove_tile(tile_name.name)
		end
	end  
end

--- Floors remove decal
local tiles_remove_decal = function()
	for _, tile_name in pairs(data.raw["tile"]) do
		if vanilla_floor_tile_names[tile_name.name] then
			tile = tile_name.name
			data.raw.tile[tile].decorative_removal_probability = 1
			--log("DUNE True: "..vanilla_floor_tile_names[tile_name.name])
			else
		--	log("DUNE Else: "..tile_name.name)
		end
	end  
end





-- Remove Water gen
local remove_water_autoplace = function()
	for name,tile in pairs(data.raw.tile) do
	    if (string.match(name,".*water.*") == name) then
	        data.raw.tile[name].autoplace = nil
	    end
	end
end



local disable_certen_trees = function()
	for _, tree_name in pairs(data.raw["tree"]) do
		--log("DUNE: Tree Name: "..tree_name.name)	
		if game_trees[tree_name.name] then
			--data.raw.tree[tree_name.name] = nil
			--log("DUNE: Tree Name: "..tree_name.name)	
			data.raw.tree[tree_name.name].autoplace = nil -- a little more Mod friendly
		end
	end  
end



-- Remove any green decoratives
local block_decorative_words = {"green", "garballo"}
for _, prototype in pairs(data.raw['optimized-decorative']) do
	for _, word in pairs(block_decorative_words) do
		if string.find(prototype.name, word) then
		--log("DUNE: Check was True: "..prototype.name)
			prototype.autoplace = nil
		end
	end
end


-- Remove Fish
data.raw['fish']['fish'].autoplace = nil

--- Remove Vanilla Spawners 
if settings.startup["Remove_Vanilla_Spawners"].value then

	data.raw["unit-spawner"]["biter-spawner"].autoplace = nil
	data.raw["unit-spawner"]["spitter-spawner"].autoplace = nil
	
end



--add collision mask to entities 
local function add_Collision_Layer(entity,layer)
	if not entity  then return end
	if entity.collision_mask then
		table.insert(entity.collision_mask, layer);
	else
		entity.collision_mask = {layer,"water-tile","player-layer"} 
	end
end


local worm_collision_layer = "layer-14"
local worms = {"small-worm-turret", "medium-worm-turret", "big-worm-turret", "behemoth-worm-turret"}


for i, worm_name in pairs (worms) do
  local worm = data.raw.turret[worm_name]
  if worm then
	add_Collision_Layer(worm, worm_collision_layer)
  end
end


--- Add Worm Collision to Floors
local floor_worm_collision_mask = function()
	for _, tile_name in pairs(data.raw["tile"]) do
		if vanilla_floor_tile_names[tile_name.name] then
			add_Collision_Layer(tile_name, worm_collision_layer)
		end
	end  
end


--- Increase worm population
data.raw.turret["small-worm-turret"].autoplace = enemy_autoplace.enemy_spawner_autoplace(0)

data.raw.turret["medium-worm-turret"].autoplace = enemy_autoplace.enemy_spawner_autoplace(1)
data.raw.turret["medium-worm-turret"].build_base_evolution_requirement = 0.15

data.raw.turret["big-worm-turret"].autoplace = enemy_autoplace.enemy_spawner_autoplace(2)
data.raw.turret["big-worm-turret"].build_base_evolution_requirement = 0.25

data.raw.turret["behemoth-worm-turret"].autoplace = enemy_autoplace.enemy_spawner_autoplace(3)
data.raw.turret["behemoth-worm-turret"].build_base_evolution_requirement = 0.50




-- Remove Landfill
data.raw.technology["landfill"].enabled = false
data.raw.recipe["landfill"].hidden = true

---Remove Offdhore pump
data.raw.recipe["offshore-pump"].hidden = true

disable_non_desert_tiles()
disable_certen_trees()
remove_water_autoplace()
tiles_remove_decal()
floor_worm_collision_mask()

	