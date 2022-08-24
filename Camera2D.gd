extends Camera2D
onready var player = get_node("/root/Dungeon1/Player")
func _physics_process(delta):
	print(player)
