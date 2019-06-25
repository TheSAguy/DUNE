require ("util")



local my_worker = util.table.deepcopy(data.raw.unit["smg-guy"])

my_worker.name = "dune-worker"
my_worker.localised_name = {"dune-worker"}
my_worker.max_health = 50
my_worker.healing_per_tick = 0.25
my_worker.minable = {mining_time = 0.1, result = "dune-worker", count = 1}
my_worker.max_pursue_distance = 1
my_worker.min_persue_time = 60 * 1
my_worker.max_health = 15
my_worker.vision_distance = 10
my_worker.pollution_to_join_attack = 10000
my_worker.attack_parameters.range = 10
my_worker.attack_parameters.min_attack_distance = 4
my_worker.attack_parameters.ammo_type.action.action_delivery[1].target_effects[1].damage.amount = 8

data:extend({my_worker})



data:extend(
{

	---- Dune Worker
	{
	type = "item",
	name = "dune-worker",
	localised_name = {"dune-worker"},
	icon = my_worker.icon,
	icon_size = my_worker.icon_size,
	icons = my_worker.icons,
	flags = {},
	subgroup = "iron-units",
	order = "aa-dune-worker",
	stack_size = 10,
	place_result = "dune-worker",
	},
	
})

