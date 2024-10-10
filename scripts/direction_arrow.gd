extends Area2D

const BULLET_2 = preload("res://scenes/bullet_2.tscn")
@onready var attack_speed_timer: Timer = $attack_speed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#var enemies_in_range = get_overlapping_bodies()
	#if enemies_in_range.size() > 0:
	var targeted_enemy = get_closest_group_member("enemy")
	if targeted_enemy != null:
		look_at(targeted_enemy.global_position)
	attack_speed_timer.wait_time = EntityStats.player_stats.attack_speed


func shoot():
	BULLET_2
	var new_bullet = BULLET_2.instantiate()
	new_bullet.global_position = %shooting_point.global_position
	new_bullet.global_rotation = %shooting_point.global_rotation
	%shooting_point.add_child(new_bullet)


func _on_attack_speed_timeout() -> void:
	shoot()


func get_closest_group_member(group_name: String) -> Node2D:
	var closest_member: Node2D = null
	var closest_distance: float = INF  # Start with a very large distance

	# Get the position of the current node (assumed to be Node2D or derived)
	var my_position: Vector2 = global_position

	# Iterate through all members of the group
	for member in get_tree().get_nodes_in_group(group_name):
		if member is Node2D:  # Ensure the member has a position (Node2D)
			var member_position: Vector2 = member.global_position
			var distance_to_member: float = my_position.distance_to(member_position)

			# Check if this member is closer than the previous closest
			if distance_to_member < closest_distance:
				closest_distance = distance_to_member
				closest_member = member

	return closest_member
