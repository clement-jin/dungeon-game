extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
 
const SPEED = 150
var velocity: Vector2 = Vector2.ZERO
onready var animatedSprite = get_node("AnimatedSprite")
onready var deathPopup = get_tree().get_root().find_node("DeathPopup", true, false)

func _physics_process(delta):
	var movement: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		movement += Vector2(-1, 0)
		animatedSprite.flip_h = true
		
	if Input.is_action_pressed("move_right"):
		movement += Vector2(1, 0)
		animatedSprite.flip_h = false
		
	if Input.is_action_pressed("move_up"):
		movement += Vector2(0, -1)
		
	if Input.is_action_pressed("move_down"):
		movement += Vector2(0, 1)
	
	velocity = velocity.normalized()
	velocity = movement * SPEED
	
	if velocity != Vector2.ZERO:
		update_animation("run")
	else:
		update_animation("idle")
	
	velocity = move_and_slide(velocity)
	
func update_animation(new_animation):
	if animatedSprite.animation != new_animation:
		animatedSprite.play(new_animation) # update the animation only if it is different!

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_hitBox_body_entered(body):
	if body.name == "skeleton1":
		deathPopup.show()
