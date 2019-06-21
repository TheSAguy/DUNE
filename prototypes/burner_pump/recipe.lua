	data:extend({

  
	  
		 --- Burner Pumpjack
		{
			type = "recipe",
			name = "dune-pumpjack",
			icon = "__Dune__/graphics/icons/basic_pumpjack.png",
			icon_size = 32,
			enabled = true,
			energy_required = 4,
			ingredients =
			{
			  {type="item", name="pipe", amount=4}, 
			  {type="item", name="iron-gear-wheel", amount=4}, 
			},
			results=
			{
			  {type="item", name="dune-pumpjack", amount=1},
			},
		},
})
