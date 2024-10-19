extends Node


var enemies_killed : int 


var player_data : Dictionary = {
	"player_hp" : 100,
	"player_money" : 0,
	"player_movement_speed" : 100,
	"bullet_type" : "insert scene here",
	"bullet_damage" : 100,
	"attack_speed" : 1, # attack speed is set per second , so 1 == 1 attack per second
	"player_range" : 100,
	"bullet_speed" : 100
	
	
}

var enemy_1_data : Dictionary = {
	"enemy_base_spawn_rate" : "TBD",
	"health" : 100,
	"movement_speed" : 10,
}

var enemy_2_data : Dictionary = {
	"enemy_base_spawn_rate" : "TBD",
	"enemy_health":"TBD",
}


func save_game():
	pass
	
	

func load_game():
	pass
