extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _on_Yes_pressed():
	get_tree().reload_current_scene()
	hide()

func _on_No_pressed():
	get_tree().quit()
