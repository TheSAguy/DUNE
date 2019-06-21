

--Romove the Bot's from Klonan's Total_Automization_0.1.6 Mod


local function Remove_Units(unit_name)

	local recipe = data.raw.recipe[unit_name]
	local technology = data.raw.technology[unit_name]

	if recipe then
		recipe.hidden = true
	end

	if technology then
		technology.enabled = false
	end
	
end

Remove_Units("blaster-bot")
Remove_Units("tazer-bot")
Remove_Units("laser-bot")
Remove_Units("plasma-bot")

Remove_Units("circuit-units")
Remove_Units("circuit-units-2")
Remove_Units("circuit-units-3")
Remove_Units("circuit-units-damage")
Remove_Units("circuit-units-damage-1")
Remove_Units("circuit-units-damage-2")
Remove_Units("circuit-units-damage-3")
Remove_Units("circuit-units-damage-4")
Remove_Units("circuit-units-damage-5")
Remove_Units("circuit-units-damage-6")
Remove_Units("circuit-unit-deployer")
Remove_Units("circuit-unit-deployer-1")
Remove_Units("circuit-unit-deployer-2")
Remove_Units("circuit-unit-deployer-3")
