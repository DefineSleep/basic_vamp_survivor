extends Control
@onready var coin_label: Label = $coin_label
@onready var animations: AnimationPlayer = $animations
const SHOP_MENU = preload("res://scenes/shop_menu.tscn")
const LEVEL_1 = preload("res://scenes/level_1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	coin_label.text = "$ :"+str(Global.player_data.player_money)


func _on_texture_button_2_pressed() -> void:
	animations.play("fade_out")


func _on_save_pressed() -> void:
	Global.save_game()


func _on_load_pressed() -> void:
	Global.load_game()


func _on_shop_button_pressed() -> void:
	pass


func _on_animations_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(LEVEL_1)
