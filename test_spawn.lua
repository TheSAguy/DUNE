----- Just used for Testing


function test_spawn()

	local surface = game.surfaces['nauvis']


--local Spawn_trees = function(tree_name, y)	
	for i = 1, 20 do
	

		--surface.create_entity({name= tree_name, position={i, y}, force = game.forces.player})
		
		--surface.create_entity({name= "tree-01", position={i, -28}, force = game.forces.player})
		--surface.create_entity({name= "tree-02", position={i, -24}, force = game.forces.player})
		--surface.create_entity({name= "tree-02-red", position={i, -20}, force = game.forces.player})
		--surface.create_entity({name= "tree-03", position={i, -16}, force = game.forces.player})-- ok
		--surface.create_entity({name= "tree-04", position={i, -12}, force = game.forces.player})
		--surface.create_entity({name= "tree-05", position={i, -8}, force = game.forces.player})
	--	surface.create_entity({name= "tree-06", position={i, 12}, force = game.forces.player}) -- ok
	--	surface.create_entity({name= "tree-06-brown", position={i, 16}, force = game.forces.player}) -- ok
		--surface.create_entity({name= "tree-07", position={i, 4}, force = game.forces.player})
--[[
		--surface.create_entity({name= "tree-08", position={i, 8}, force = game.forces.player})
		--surface.create_entity({name= "tree-08-brown", position={i, 12}, force = game.forces.player})
		surface.create_entity({name= "tree-08-red", position={i, 20}, force = game.forces.player})
		--surface.create_entity({name= "tree-09", position={i, 16}, force = game.forces.player})
		--surface.create_entity({name= "tree-09-brown", position={i, 20}, force = game.forces.player})
		surface.create_entity({name= "tree-09-red", position={i, 24}, force = game.forces.player})-- ok
		surface.create_entity({name= "dry-tree", position={i, 28}, force = game.forces.player})
		surface.create_entity({name= "dead-tree-desert", position={i, 32}, force = game.forces.player})
		surface.create_entity({name= "dead-grey-trunk", position={i, 36}, force = game.forces.player})
		surface.create_entity({name= "dead-dry-hairy-tree", position={i, 40}, force = game.forces.player})
		surface.create_entity({name= "dry-hairy-tree", position={i, 44}, force = game.forces.player})

		surface.create_entity({name= " tree-wetland-a", position={i, 4}, force = game.forces.player})
		

surface.create_entity({ name= "tree-desert-a", position={i, 0}, force = game.forces.player})
surface.create_entity({ name= "tree-desert-b", position={i, 8}, force = game.forces.player})
surface.create_entity({ name= "tree-desert-c", position={i, 16}, force = game.forces.player})
surface.create_entity({ name= "tree-desert-d", position={i, 24}, force = game.forces.player})
surface.create_entity({ name= "tree-desert-e", position={i, 32}, force = game.forces.player})
surface.create_entity({ name= "tree-desert-f", position={i, 40}, force = game.forces.player})
	
surface.create_entity({ name= "tree-desert-g", position={i, 48}, force = game.forces.player})
]]
	--surface.create_entity({ name= "smg-guy", position={0, -150}, force = game.forces.enemy})


		
	end

	
	

	local chest2 = game.surfaces[1].create_entity{name = "steel-chest", position = {0, -10}, force = game.forces.player}
	chest2.insert{name="melange", count = 20000}
	--chest2.insert{name="stone", count = 100}
	
	local function player_insert_items(event, item, count)
	  
		local player = event and game.players[event.player_index]
		if game.item_prototypes[item] ~= nil and player.name == "TheSAguy" then
			if player then
				player.insert{name=item, count = count}
			else
				for _, p in pairs(game.players) do
					p.insert{name=item, count = count}
				end
			end
		end

	end



	script.on_event(defines.events.on_player_created, function(event)
			
				--local iteminsert = game.players[event.player_index].insert
				player_insert_items(event, "submachine-gun", 1)
				player_insert_items(event, "melange", 1000)
				player_insert_items(event, "vehicle-miner", 5)
				player_insert_items(event, "stone-brick", 100)
				player_insert_items(event, "dune-worker", 5)		
			
	end)
		
		surface.always_day = true
end

