extends Node


var enemies_killed : int 


var player_data : Dictionary = {
	"player_hp" : 50,
	"player_money" : 0,
	"player_movement_speed" : 100, #Balancepatch : set to 50 
	"bullet_type" : "insert scene here",
	"bullet_damage" : 50,
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

#-------
# SAVE GAME / LOAD GAME
#-------

func load_game()->void :
	var file = FileAccess.open("res://savegame.json", FileAccess.READ)
	var json = file.get_as_text()
	var saved_data1 = JSON.parse_string(json)
	player_data = saved_data1["player_data"]
	file.close

func save_game()->void:
	var file = FileAccess.open("res://savegame.json", FileAccess.WRITE)
	var saved_data1 = {}
	saved_data1["player_data"] = player_data
	printerr(saved_data1)
	var json = JSON.stringify(saved_data1)
	file.store_string(json)
	file.close
