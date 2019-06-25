require ("util")

--- Thanks to Darkfrei for this code!
-- https://mods.factorio.com/mod/MovingWorms

local worms = {}

for worm_name, worm_turret in pairs (data.raw.turret) do
  if string.match(worm_name, "worm") then
    local worm = table.deepcopy (worm_turret)
    --data.raw.turret[worm_name].autoplace = nil
    worm.type = 'unit'
    worm.name = 'unit-'..worm_name
    worm.localised_name = {'entity-name.'..worm_name}
    
    worm.distraction_cooldown = 300
    
    worm.vision_distance = 20
    worm.movement_speed = 0.0185
    worm.distance_per_frame = 0.04
    worm.pollution_to_join_attack = 200
    worm.run_animation = worm.prepared_animation
    worm.attack_parameters.animation = worm.starting_attack_animation
    table.insert (worms, worm)
	
  end
end

data:extend(worms)