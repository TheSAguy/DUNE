
require ("util")
require ("story")
require ("mod-gui")
require ("globals")
require ("test_spawn")



time_modifier = 1
evo_increase_per_level = 0.025 --2.5%
worker_spawn_time = 2 -- 2 Min
attach_interval = worker_spawn_time

points_per_second_start = 5 -- Not Used
points_per_second_level_subtract = 0.2 -- Not Used

local function On_Init()

	--test_spawn()
	globals()
	validate_prototypes()
	global.story = story_init(story_table)
	global.required = {}
	global.chests = {}
	make_brick_circle()
	force = game.forces.player
	
	local chest = game.surfaces[1].create_entity{name = "dune-palace", position = {1, 1}, force = force}
	--- Starting Materials
	for k, chest in pairs (game.surfaces[1].find_entities_filtered{name = "dune-palace"}) do
		chest.minable = false
		chest.insert({name = "stone-brick", count = 1000})
		if settings.startup["start-with-vehicle-miner"] and settings.startup["start-with-vehicle-miner"].value == false then
			chest.insert{name="vehicle-miner", count = 1}
		end
		global.chests[chest.unit_number] = chest
	end
	global.level = 1
	global.points = 0
	

	
end


--------------------------------------------------------------------
local function On_Config_Change()

	globals()
	validate_prototypes()
	global.story = story_init(story_table)
	
end


local function On_Death(event)

	local entity = event.created_entity or event.entity
	
	--- Palace been destroyed	- YOU LOSE
 	if entity.valid and entity.name == "dune-palace" then
		game.set_game_state{game_finished=true, player_won=false}
	end

end

time_per_level = 600
levels =
{
  -- 1
  {
    requirements =
    {
      {name = "melange", count = 100 }
    },
    time = time_per_level/2 -- 5 Min  
  },

  -- 2
  {
    requirements =
    {
      {name = "melange", count = 2000}
    },
    time = time_per_level/2 -- 5 Min 
  },

  -- 3
  {
    requirements =
    {
      {name = "melange", count = 3000}
    },
    time = time_per_level/2 -- 5 Min 
  },

  -- 4
  {
    requirements =
    {
		{name = "melange", count = 4000}
    },
    time = time_per_level/2 -- 5 Min  -- 20 min of game time up.
  },

  -- 5
  {
    requirements =
    {
		{name = "melange", count = 5000}
    },
    time = time_per_level -- 10 Min  
  },

  -- 6
  {
    requirements =
    {
		{name = "melange", count = 7500}
    },
    time = time_per_level -- 10 Min 
  },

  -- 7
  {
    requirements =
    {
		{name = "melange", count = 10000}
    },
    time = time_per_level -- 10 Min  -- 50 min in. Need to produce at 1,000 per min
  },

  -- 8
  {
    requirements =
    {
		{name = "melange", count = 12000}
    },
    time = time_per_level -- 10 Min 
  },

  -- 9
  {
    requirements =
    {
		{name = "melange", count = 14000}
    },
    time = time_per_level -- 10 Min 
  },

  -- 10
  {
    requirements =
    {
		{name = "melange", count = 16000}
    },
    time = time_per_level -- 10 Min 
  },

  -- 11
  {
    requirements =
    {
		{name = "melange", count = 20000}
    },
    time = time_per_level -- 10 Min Produce 2K/min
  },

  -- 12
  {
    requirements =
    {
		{name = "melange", count = 30000}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 13
  {
    requirements =
    {
		{name = "melange", count = 37500}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 14
  {
    requirements =
    {
		{name = "melange", count = 45000}
    },
    time = time_per_level * 1.5 -- 15min Produce 3K/min
  },

  -- 15
  {
    requirements =
    {
		{name = "melange", count = 52500}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 16
  {
    requirements =
    {
		{name = "melange", count = 60000}
    },
    time = time_per_level * 1.5 -- 15min 4K/min
  },

  -- 17
  {
    requirements =
    {
		{name = "melange", count = 63750}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 18
  {
    requirements =
    {
		{name = "melange", count = 67500}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 19
  {
    requirements =
    {
		{name = "melange", count = 71250}
    },
    time = time_per_level * 1.5 -- 15min
  },

  -- 20
  {
    requirements =
    {
		{name = "melange", count = 75000}
    },
    time = time_per_level * 1.5 -- 15min - 5K /min
  },

  -- 21 - FINAL
  {
    requirements =
    {
		{name = "melange", count = 300000}
    },
    time = time_per_level * 3 -- 30min 10K/Min
  }
}
local completed_label_color = {g = 0.6}


function update_info()
  local level = levels[global.level]
  local accumulated = global.accumulated
  for k, player in pairs (game.players) do
    local frame = mod_gui.get_frame_flow(player).frame
    local table = frame.table
    for index, item in pairs(level.requirements) do
      local accumulated = accumulated[item.name]
      local label = table[item.name]
      label.caption = accumulated .. "/" .. item.count
      if accumulated == item.count then
        label.style.font_color = completed_label_color
      end
    end
  end
end

function get_time_left()
  return global.level_started_at + time_modifier * levels[global.level].time * 60 - game.tick
end

local low_time_left_label_color = {r = 1}

function update_time_left(tick)
  --If given not given a tick, we update regardless
  if tick and tick % 60 ~= 0 then return end
  time_left = get_time_left()
  if time_left < 0 then
    time_left = 0
  end
  local caption = {"time-left", util.formattime(time_left)}
  local low_time_left = time_left < 60 * 30
  for k, player in pairs (game.players) do
    local label = mod_gui.get_frame_flow(player).frame.time_left
    label.caption = caption
    if low_time_left then
      label.style.font_color = low_time_left_label_color
    end
  end
end


script.on_event(defines.events.on_tick, function(event)


	story_update(global.story, event, "")

	-- Clear Worms in starting area
	if game.tick % (2) == 0 then
		remove_worms()
	end
  
  
	-- Create a Worker 
	if game.tick % (60 * 60 * worker_spawn_time) == 0 then -- 3600 = one min
		local PositionValid = game.surfaces[1].find_non_colliding_position("dune-worker", {-1, 4}, 2 , 1)
			if PositionValid then
				spawn_worker = game.surfaces[1].create_entity({name = "dune-worker", position = PositionValid, force = game.forces.player})
			else	
				--game.print("No Position")
			end	
	end
		
end)

story_table =
{
  {
    {
      action = function()
        if not game.is_multiplayer() then
			game.show_message_dialog{text = {"dune_welcome"}}
			game.show_message_dialog{text = {"dune_rules_1"}}
			game.show_message_dialog{text = {"dune_rules_2"}}
			game.show_message_dialog{text = {"dune_rules_3"}}
			game.show_message_dialog{text = {"dune_rules_6"}}
		    game.show_message_dialog{text = {"dune_tips_1"}}
		    game.show_message_dialog{text = {"dune_tips_2"}}
			game.show_message_dialog{text = {"dune_tips_3"}}
        end
      end
    },
    {},
    {
      name = "level-start",
      init = function(event)
        global.accumulated = {}
        global.required = {}
        global.labels = {}
        local level = levels[global.level]
        for k, player in pairs (game.players) do
          make_frame(player)
        end
        for index, item in pairs(levels[global.level].requirements) do
          global.accumulated[item.name] = 0
          global.required[item.name] = item.count
        end
        if global.level < #levels then
          for k, player in pairs (game.players) do
            update_frame(player, levels[global.level + 1])
          end
          local item_prototypes = game.item_prototypes
          for index, item in pairs(levels[global.level + 1].requirements) do
            local diff
            if global.required[item.name] ~= nil then
              diff = item.count - global.required[item.name]
            else
              diff = item.count
            end
            for k, player in pairs (game.players) do
              update_table(player, diff, item)
            end
          end
        end
        global.level_started_at = event.tick
        update_info()
        update_time_left()
      end
    },
    {
      name = "level-progress",
      update = function(event)
        update_time_left(event.tick)
        local update_info_needed = false
        local level = levels[global.level]
        for index, chest in pairs(global.chests) do
          if chest.valid then
            local inventory = chest.get_inventory(defines.inventory.chest)
            local contents = inventory.get_contents()
            for itemname, count in pairs(contents) do
              if global.accumulated[itemname] then
                local counttoconsume = global.required[itemname] - global.accumulated[itemname]
                if counttoconsume > count then
                  counttoconsume = count
                end
                if counttoconsume ~= 0 then
                  inventory.remove{name = itemname, count = counttoconsume}
                  global.accumulated[itemname] = global.accumulated[itemname] + counttoconsume
                  update_info_needed = true
                end
              end
            end
          end
        end
        if update_info_needed then
          update_info()
        end
      end,
      condition = function(event)
        local level = levels[global.level]
        local time_left = get_time_left()

        if event.name == defines.events.on_gui_click and
           event.element.name == "next_level" then --- Clicking this button does not work!
          local seconds_left = math.floor(time_left / 60)
          local points_addition = math.floor(seconds_left * (points_per_second_start - global.level * points_per_second_level_subtract))
          --game.print({"time-bonus", util.format_number(points_addition), seconds_left})
          global.points = global.points + points_addition		  
		   
          for k, player in pairs (game.players) do
            if mod_gui.get_button_flow(player).next_level ~= nil then
              mod_gui.get_button_flow(player).next_level.destroy()
            end
          end
          return true
        end

        local result = true
        for index, item in pairs(level.requirements) do
          local accumulated = global.accumulated[item.name]
          if accumulated < item.count then
            result = false
          end
        end

        if result then
          for k, player in pairs (game.players) do
            if mod_gui.get_button_flow(player).next_level == nil then
              mod_gui.get_button_flow(player).add{type = "button", name = "next_level", caption={"next-level"}, style = mod_gui.button_style}
            end
          end
        end

        if time_left <= 0 then
          if result == false then
            for k, player in pairs (game.players) do
              player.set_ending_screen_data({"points-achieved", util.format_number(global.points)})
            end
			--- Create Enemy Forces that attack you when you don't finish your goal in time.
			if not global.emperor_message_1_sent then
				game.print("The Emperor is not happy that you did not make the monthly shipment!")
				game.print("Expect other houses to take advantage of this...")
				global.emperor_message_1_sent = true
			end
			create_enemy_forces()
            --game.set_game_state{game_finished=true, player_won=false}
            return false
          else
            return true
          end
        end

        return false
      end,
      action = function(event, story)
        for k, player in pairs (game.players) do
          if mod_gui.get_button_flow(player).next_level ~= nil then
            mod_gui.get_button_flow(player).next_level.destroy()
          end
        end
        global.level = global.level + 1
        local points_addition = (global.level - 1) * 10
        --game.print({"level-completed", global.level - 1, util.format_number(points_addition)})
		--game.print({"level-completed", global.level - 1})
		game.print("Shipment "..(global.level - 1).."received. Goal Achieved!")
		
        global.points = global.points + points_addition
		global.emperor_message_1_sent = false
		---- Increase Evolution factor by 2.5%
		game.forces.enemy.evolution_factor = game.forces.enemy.evolution_factor + evo_increase_per_level
		

		for k, chest in pairs (game.surfaces[1].find_entities_filtered{name = "dune-palace"}) do
			--game.print("Stuff Added to Palace")
			--- Insert Rewards
			local rewards_table = get_rewards_to_add()
			local rewards_name = rewards_table.spawn	
			local rewards_count = rewards_table.count
			chest.insert({name = rewards_name, count = rewards_count})
		end	
		
        if global.level < #levels + 1 then
          for k, player in pairs (game.players) do
            mod_gui.get_frame_flow(player).frame.destroy()
          end
          story_jump_to(story, "level-start")
        end
      end
    },
    {
      action = function()
        for k, player in pairs (game.players) do
          player.set_ending_screen_data({"points-achieved", util.format_number(global.points)})
        end
      end
    }
  }
}

story_init_helpers(story_table)


function plant_trees(event)
	--- Place Palm trees around Water 
	local look_for_water = game.surfaces[1].find_entities_filtered{area = event.area, name = "ground-water"}    
	
	for i = 1, #look_for_water do
		local tree_name
		if game.active_mods["alien-biomes"] then 
			tree_name = "tree-palm-a"
		else 
			tree_name = "tree-05"
		end
		
		
		local number_of_trees = math.floor(math.random(5))
		local radius = 1
		local pos = look_for_water[i].position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}		
		
		for i = 1, number_of_trees do
		
			local x_offset = math.random(-5, 5)
			local y_offset = math.random(-5, 5)
			local position_c = {pos.x + x_offset, pos.y + y_offset}
			local PositionValid = game.surfaces[1].find_non_colliding_position(tree_name, position_c, 2 , 0.5)
			
			if PositionValid then 			
				spawn_tree = game.surfaces[1].create_entity({name = tree_name, position = position_c})
			end
			
		end
		
	end
	
end

--- Spawn worms on Melange
function spawn_worms_on_melange(event)

	local look_for_melange = game.surfaces[1].find_entities_filtered{area = event.area, name = "melange"} 
	--game.print("Got to on_chunk_generated")
        
	for i = 1, #look_for_melange do

	local worm_name
		if game.forces.enemy.evolution_factor <= 0.1 then
			worm_name = "small-worm-turret"
		elseif game.forces.enemy.evolution_factor <= 0.25 then
			worm_name = "medium-worm-turret"
		elseif game.forces.enemy.evolution_factor <= 0.45 then
			worm_name = "big-worm-turret"
		else
			worm_name = "behemoth-worm-turret"
		end
		
		local radius = 2.5
		local pos = look_for_melange[i].position
		local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}			
		local PositionValid = game.surfaces[1].find_non_colliding_position(worm_name, look_for_melange[i].position, 2 , 0.5)
		local look_for_worms = game.surfaces[1].find_entities_filtered{area = area, name = worm_name} 

		if PositionValid then --and not look_for_worms then
			--game.print("Found Spot for Worm")
			if #look_for_worms >= 1 then

			else
				spawn_spawner = game.surfaces[1].create_entity({name = worm_name, position = look_for_melange[i].position , force = game.forces.enemy})
			end
		end
		
      --
    end
end


script.on_event(defines.events.on_chunk_generated, function(event)
    
	--- Spawn worms on Melange
	spawn_worms_on_melange(event)

	--- Place Palm trees around Water 
	plant_trees(event)
		

end)


script.on_event(defines.events.on_player_joined_game, function(event)
	on_joined(event)
end)


function on_joined(event)
  if event.name ~= defines.events.on_player_created then return end
  local player = game.players[event.player_index]
  player.insert{name = "iron-plate", count = 20}
  make_frame(player)
  if global.level < #levels then
    update_frame(player, levels[global.level + 1])
    for index, item in pairs(levels[global.level + 1].requirements) do
      local diff
      if global.required[item.name] ~= nil then
        diff = item.count - global.required[item.name]
      else
        diff = item.count
      end
      update_table(player,diff,item)
    end
  end
end

function make_frame(player)
  local flow = mod_gui.get_frame_flow(player)
  if flow.frame then
    flow.frame.destroy()
  end
  local frame = flow.add{type = "frame", name = "frame", direction = "vertical", caption = {"level", global.level}}
  frame.add{type = "label", name = "time_left", caption = {"time-left", "-"}}
  --frame.add{type = "label", caption = {"points-per-second", points_per_second_start - global.level * points_per_second_level_subtract}}
  --frame.add{type = "label", caption = {"points", util.format_number(math.floor(global.points))}}
  frame.add{type = "label", caption = {"required-items"}, style = "caption_label"}
  local table = frame.add{type = "table", name = "table", column_count = 2}
  table.style.column_alignments[2] = "right"
  for index, item in pairs(levels[global.level].requirements) do
    table.add{type = "label", caption = {"", game.item_prototypes[item.name].localised_name, {"colon"}}}
    table.add{type = "label", caption = "0/" .. item.count, name=item.name}
  end
  return frame
end

function update_frame(player, next_level)
  local frame = mod_gui.get_frame_flow(player).frame
  if not frame then
    frame = make_frame(player)
  end
  frame.add{type= "label", caption={"next-level"}, style = "caption_label"}
  local next_level_table = frame.add{type = "table", column_count=2, name = "next_level_table"}
  next_level_table.style.column_alignments[2] = "right"
end

function update_table(player, diff, item)
  local table = mod_gui.get_frame_flow(player).frame.next_level_table
  if not table then game.print("No table for update_table function") return end
  if diff ~= 0 then
    table.add{type = "label", caption = {"", game.item_prototypes[item.name].localised_name, {"colon"}}}
  end
  if diff > 0 then
    table.add{type = "label", caption = "+" .. diff}
    return
  end
  if diff < 0 then
    table.add{type = "label", caption = diff}
    return
  end
end

function validate_prototypes()
  local items = game.item_prototypes
  local is_error = false
  local bad_items = {}
  for k, level in pairs (levels) do
    for k, item in pairs (level.requirements) do
      if not items[item.name] or item.count <= 0 then
        is_error = true
        bad_items[item.name] = item.count
      end
    end
  end
  if is_error then
    error("Bad prototypes in supply challenge:\n"..serpent.block(bad_items))
  end
end


-- Remove worms from starting area
function remove_worms()
	if global.dune_worm_check then
	global.dune_worm_check_count = global.dune_worm_check_count + 1
	
	if global.dune_worm_check_count >= 4 then
		global.dune_worm_check = false
	end
	
	local worms = {"small-worm-turret", "medium-worm-turret", "big-worm-turret", "behemoth-worm-turret"}
	for _, word in pairs(worms) do
		local radius = 150	
		local area = {{0 - radius, 0 - radius}, {0 + radius, 0 + radius}}	
		local look_for_worms = game.surfaces[1].find_entities_filtered{area = area, name = word} 

		--game.print("Number of Worms: "..#look_for_worms)
		if (#look_for_worms > 0)  then	
			for i = 1, #look_for_worms do
				local look_for_worms = look_for_worms[i]
				look_for_worms.destroy()
			end
		end			
	end
	end
end
	
--- Make Brick Circle in Starting area
function make_brick_circle()
	local changed_tiles = {}
	-- fill changed_tiles with tiles that are within a radius of the 0,0 position
	-- and designate them to be 'stone-path's
	local radius = 15
	--local pos = {1,1}
	local area = {{0 - radius, 0 - radius}, {0 + radius, 0 + radius}}	

   for x = -radius, radius do
      for y = -radius, radius  do
	 if math.sqrt(x*x + y*y) < radius then
	    table.insert(changed_tiles, {name="stone-path", position={x, y}})
	 end
      end
   end
   
   -- apply the stone path tiles
   if #changed_tiles > 0 then
      game.surfaces[1].set_tiles(changed_tiles)
   end
   
   --- Remove stuff around starting area.
   local stuff_list = {"tree", "simple-entity"}
	for _, stuff in pairs(stuff_list) do

		local radius = 25
		local area = {{0 - radius, 0 - radius}, {0 + radius, 0 + radius}}
		local look_for_stuff = game.surfaces[1].find_entities_filtered{area = area, type = stuff} 


		if (#look_for_stuff > 0)  then	
			for i = 1, #look_for_stuff do
				local look_for_stuff = look_for_stuff[i]
				look_for_stuff.destroy()
			end
		end	
	end

end	


--- Select rewards to Spawn												
function get_rewards_to_add()
	local factor = global.level * 10 -- 10 - 210
	local reward_options = 
		{
			{spawn="dune-worker" , weight = 800, count = 1},
			{spawn="dune-worker" , weight = 300, count = 2},
			{spawn="dune-worker" , weight = 50, count = 3},
			{spawn="vehicle-miner" , weight = 10, count = 1},
			{spawn="radar" , weight = 20, count = 1},
			{spawn="stone" , weight = 100, count = 400},
			{spawn="stone-brick" , weight = 300, count = 100},
		}
					  
	local calculate_odds = {}
	for k,spawn in ipairs(reward_options) do
		for i=1, spawn.weight do
			calculate_odds[#calculate_odds+1] = k
		end
	end

	local random_num = #calculate_odds
	return reward_options[calculate_odds[math.random(random_num)]]

end
	
	
--- Select the Enemy to Spawn												
function get_enemy_to_spawn()
	local factor = math.floor(game.forces.enemy.evolution_factor * 1000)
	local enemy_options = 
		{
		  {spawn="smg-guy", weight = 2100 - (factor*2)},   --  2100 - 100
		  {spawn="rocket-guy" , weight = 1150 - (factor)}, -- 1150 - 150
		  {spawn="scout-car" , weight = 300 + (factor/4)},-- 300 - 550
		  {spawn="shell-tank" , weight = 1 + (factor)}, -- 1 - 1000
		  {spawn="blaster-bot", weight = 1200 - (factor)}, --  1100 - 100
		  {spawn="tazer-bot" , weight = 400 - (factor/4)}, -- 400 - 150
		  {spawn="laser-bot" , weight = 50 + (factor/4)}, -- 50 - 300
		  {spawn="plasma-bot" , weight = 5 + (factor)}, -- 5 - 1005
		}
					  
	local calculate_odds = {}
	for k,spawn in ipairs(enemy_options) do
		for i=1, spawn.weight do
			calculate_odds[#calculate_odds+1] = k
		end
	end

	local random_num = #calculate_odds
	return enemy_options[calculate_odds[math.random(random_num)]]

end
	

function create_enemy_forces()

	global.attack_counter = global.attack_counter + 1
	if global.attack_counter >= ((attach_interval * 60 * 60) - (global.level * 180)) then
	--game.print("Check True")
		local time_left = get_time_left()
		
		if time_left <= 0 then
								
			for i = 1, (global.level + 1) do
				
				local position = {}
				--local enemy_name = "rocket-guy"
				local enemy_table = get_enemy_to_spawn()
				local enemy_name = enemy_table.spawn		
				local radius = 2.5
				local x_offset = math.random(-500, 500) 
				local y_offset = math.random(-500, 500) 
				local save_zone = 100
				if x_offset >= 0 and x_offset < save_zone then x_offset = x_offset + save_zone elseif x_offset >= (save_zone*-1) then x_offset = x_offset - save_zone end
				if y_offset >= 0 and y_offset < save_zone then y_offset = y_offset + save_zone elseif y_offset >= (save_zone*-1) then y_offset = y_offset - save_zone end
				local position = {x_offset, y_offset}
				local area = {{x_offset - radius, y_offset - radius}, {x_offset + radius, y_offset + radius}}			

			
				for _,force in pairs( game.forces )do
					if force.name == "enemy" then
						force.chart( game.surfaces[1], area)
						
					end
				end

				
				local PositionValid = game.surfaces[1].find_non_colliding_position(enemy_name, position, 2 , 0.5)


				if PositionValid then 
					--game.print("Enemy Force Spawned Name: "..enemy_name)
					
					
					spawn_enemy_unit = game.surfaces[1].create_entity({name = enemy_name, position = PositionValid , force = game.forces.palyer})
				end
			end
		end
	global.attack_counter = 0
	end	
end
	



	
				
script.on_init(On_Init)
script.on_configuration_changed(On_Config_Change)


local death_events = {defines.events.on_entity_died, defines.events.script_raised_destroy}
script.on_event(death_events, On_Death)


