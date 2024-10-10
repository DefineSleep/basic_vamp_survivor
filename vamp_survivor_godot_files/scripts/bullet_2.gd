extends Area2D

var travel_distance = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var attack_range = 200 #EntityStats.player_stats.attack_range
	var speed = 200 #EntityStats.player_stats.bullet_speed
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travel_distance += speed * delta 
	if travel_distance > attack_range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
