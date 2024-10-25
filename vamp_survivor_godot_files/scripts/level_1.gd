extends Node2D

const ENEMY_1 = preload("res://scenes/enemy_1.tscn")
@onready var timer: Timer = $spawn_timer
@onready var player: CharacterBody2D = $player
@onready var camera: Camera2D = $player/Camera2D
@onready var path_follow_2d: PathFollow2D = $player/Camera2D/Path2D/PathFollow2D
@onready var game_over_screen: CanvasLayer = $game_over_screen


var enemy_spawn_count : int = 0




# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	
	timer.autostart = true
	timer.wait_time = 1
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("space"):
		#spawn_enemy()

	pass

#pain in the ass function that doesnt work right
func spawn_enemy_outside_camera(_camera : Camera2D, _min_distance_off_camera:float, _max_distance_off_camera:float)->void:
	var instance = ENEMY_1.instantiate()
	var camera_position = _camera.position
	var screen_size = get_viewport().get_visible_rect().size
	var side = randi()%4
	var spawn_position: Vector2
	
	match side: 
		0: #left
			spawn_position.x = camera_position.x - screen_size.x /2 - randf_range(_min_distance_off_camera,_max_distance_off_camera)
			spawn_position.y = camera_position.y + randf_range(-screen_size.y/2,screen_size.y/2)
		1: #right
			spawn_position.x = camera_position.x + screen_size.x / 2 + randf_range(_min_distance_off_camera, _max_distance_off_camera)
			spawn_position.y = camera_position.y + randf_range(-screen_size.y / 2, screen_size.y / 2)
		2: #top
			spawn_position.x = camera_position.x + randf_range(-screen_size.x / 2, screen_size.x / 2)
			spawn_position.y = camera_position.y - screen_size.y / 2 - randf_range(_min_distance_off_camera, _max_distance_off_camera)
		3: #bottom
			spawn_position.x = camera_position.x + randf_range(-screen_size.x / 2, screen_size.x / 2)
			spawn_position.y = camera_position.y + screen_size.y / 2 + randf_range(_min_distance_off_camera, _max_distance_off_camera)
	instance.position = spawn_position
	add_child(instance)
	enemy_spawn_count += 1

func spawn_mob():
	var mob = ENEMY_1.instantiate()
	path_follow_2d.progress_ratio = randf()
	mob.global_position = path_follow_2d.global_position
	add_child(mob)
	enemy_spawn_count += 1


	
func spawn_timer():
	pass


func _on_spawn_timer_timeout() -> void:
	#spawn_enemy_outside_camera(camera, 1,2)
	spawn_mob()
	
	printerr(enemy_spawn_count)


func _on_player_health_depleted() -> void:
	game_over_screen.visible = true
	get_tree().paused = true


func _on_back_to_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
