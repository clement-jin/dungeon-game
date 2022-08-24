extends KinematicBody2D

onready var player = get_tree().get_root().find_node("Wizard", true, false)
const SPEED = 80
const SIGHT_RANGE = 300
var velocity = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body/

func _physics_process(delta):
	var target_velocity
	
	if player_in_los():
		target_velocity = (player.global_position - 
		global_position).normalized() * SPEED
	else:
		target_velocity = Vector2.ZERO
	
	velocity = lerp(velocity, target_velocity, 0.2)
	velocity = move_and_slide(velocity)

func player_in_los():
	var los_obstacle = get_world_2d().direct_space_state.intersect_ray(
		global_position, player.global_position, [self]
	)

	var distance_to_player = player.global_position.distance_to(self.global_position)
		
	if los_obstacle.collider == player and distance_to_player < SIGHT_RANGE:
		return true
		
	return false
