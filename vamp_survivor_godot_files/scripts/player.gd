extends CharacterBody2D

signal health_depleted

@onready var score: Label = $CanvasLayer/topbar/score
@onready var hurtbox: Area2D = $hurtbox

@onready var health_bar: ProgressBar = $CanvasLayer/topbar/ProgressBar


var max_health = 100 #EntityStats.player_stats.max_health
var current_health = max_health


#var player_range = get_range()
var char_speed : int = 100
var last_direction : Vector2 

func _ready() -> void:
	health_bar.max_value = max_health



func _physics_process(delta: float) -> void:
	health_bar.value = current_health
	get_better_inputs()
	move_and_slide()
	score.text = "Score:"+str(Global.enemies_killed)
	var damage_rate = 100.0
	var overlapping_mobs = hurtbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		current_health -= damage_rate * overlapping_mobs.size() * delta
		if current_health <= 0 :
			health_depleted.emit()


func get_better_inputs()->void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * char_speed
	
func shoot_at_shit():
	pass

	
#func get_input()->void: bad inputs
	#var input_direction = Vector2.ZERO
	#if Input.is_action_pressed("left"):
		#input_direction.x = -1
	#elif Input.is_action_pressed("right"):
		#input_direction.x = 1
	#if input_direction.x == 0:
		#if Input.is_action_pressed("up"):
			#input_direction.y = -1
		#elif Input.is_action_pressed("down"):
			#input_direction.y = 1
	#velocity = input_direction * char_speed
	#if input_direction != Vector2.ZERO:
		#last_direction = input_direction
	#move_and_slide()
