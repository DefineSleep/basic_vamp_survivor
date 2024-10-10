extends CharacterBody2D



@onready var player = get_tree().get_first_node_in_group("player")


#-----------
#	Stats
#-----------

var health_max : int = EntityStats.enemy_1.health_max
var health_current : int = health_max

var movement_speed : float = EntityStats.enemy_1.speed
var damage_taken : float = EntityStats.player_stats.bullet_damage
#-----------





func _ready() -> void:
	pass


func _process(delta: float) -> void:
	animation_handler()
	enemy_death()


func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	move_and_slide()
	
func enemy_death():
	if health_current <= 0:
		self.queue_free()
		Global.enemies_killed +=1 

func animation_handler():
	if velocity.x > 0:  
		$AnimatedSprite2D.flip_h = false 
	elif velocity.x < 0:  
		$AnimatedSprite2D.flip_h = true   

func take_damage():
	printerr("-"+str(damage_taken))
	health_current -= damage_taken
