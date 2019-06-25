


require("prototypes/world/world_preset")
require("prototypes/world/world")
require("prototypes/units/total_automization_tweaks")
require("prototypes/units/units")
require("prototypes/units/moving_worms")


local Blocked_Buildings = 
{
    "furnace",
	"boiler",
    "generator",
	"radar",
	"assembling-machine",
	"solar-panel",
	"lab",
	"rocket-silo",
	"roboport",
	"storage-tank",
	"pump",
	"market",
	"accumulator",
	"beacon",
	"electric-turret",
	"ammo-turret",
	"reactor"
}

local Recipes_that_need_worker = 
{
	--- Vanila
	["electric-mining-drill"] = true,
	["radar"] = true,
	["assembling-machine-1"] = true,
	["assembling-machine-2"] = true,
	["assembling-machine-3"] = true,
	["lab"] = true,
	["rocket-silo"] = true,
	["roboport"] = true,
	["pumpjack"] = true,
	["oil-refinery"] = true,
	["chemical-plant"] = true,
	["nuclear-reactor"] = true,
	["centrifuge"] = true,
	--- aai-vehicles-miner_0.4.7
	["vehicle-miner"] = true,
	["vehicle-miner-mk2"] = true,
	["vehicle-miner-mk3"] = true,
	["vehicle-miner-mk4"] = true,
	["vehicle-miner-mk5"] = true,
	--- Total_Automization_0.1.6
	["smg-guy"] = true,
	["rocket-guy"] = true,
	["scout-car"] = true,	
	["shell-tank"] = true
}

local terrain_collision_layer = "layer-15"

--add collision mask to entities 
local function add_Collision_Layer(entity,layer)
	if not entity  then return end
	if entity.collision_mask then
		table.insert(entity.collision_mask, layer);
	else
		entity.collision_mask = {layer,"water-tile","player-layer"} 
	end
end


--Add collision to mask for non mineable tiles
for _,tile in pairs(data.raw["tile"]) do
	if not tile.minable then
		add_Collision_Layer(tile,terrain_collision_layer);
	end
end

--Add Collision layer to the Entity List.
for i = 1, #Blocked_Buildings do
	local entity = Blocked_Buildings[i]
	for _, entity in pairs(data.raw[entity]) do
		add_Collision_Layer(entity, terrain_collision_layer)
	end
end


--Add "Worker" to Recipe List
for _,recipe in pairs(data.raw["recipe"]) do
	if Recipes_that_need_worker[recipe.name] then
		thxbob.lib.recipe.add_new_ingredient (recipe.name, {type = "item", name = "dune-worker", amount = 1})
	end
end



---- Game Tweaks ---- Player
if settings.startup["Double_Player_Reach"].value then	

	local chr = data.raw.character.character
	
	--- Loot Picup	
	if chr.loot_pickup_distance then
		chr.loot_pickup_distance = chr.loot_pickup_distance * 2 
	end	

	if chr.build_distancethen then -- Vanilla 6
		chr.build_distance = chr.build_distance * 2
	end
	
	if chr.drop_item_distance then -- Vanilla 6
		chr.drop_item_distance = chr.drop_item_distance * 2
	end
	
	if chr.reach_distance then -- Vanilla 6
		chr.reach_distance = chr.reach_distance * 2
	end

	if chr.item_pickup_distance then -- Vanilla 1
		chr.item_pickup_distance = chr.item_pickup_distance * 2
	end
	
	if chr.reach_resource_distance then -- Vanilla 2.7
		chr.reach_resource_distance = chr.reach_resource_distance * 2
	end
		
	if chr.resource_reach_distance then -- Vanilla 2.7
		chr.resource_reach_distance = chr.resource_reach_distance * 2
	end

end	


