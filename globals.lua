
--- Defining my Globals
function globals()

	if global.dune_worm_check == nil then
		global.dune_worm_check = true
	end
	if global.dune_worm_check_count == nil then
		global.dune_worm_check_count = 0
	end


	if global.attack_counter == nil then
		global.attack_counter = 0		
	end	

	if global.emperor_message_1_sent == nil then
		global.emperor_message_1_sent = false		
	end	
	
	if global.time_left == nil then
		global.time_left = 0		
	end	
	
end
	