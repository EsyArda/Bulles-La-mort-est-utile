extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var move_speed := 100
export var gravity := 2000
export var jump_speed := 550

var velocity := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	# reset horizontal velocity
	velocity.x = 0
	
	# set horizontal velocity
	if Input.is_action_pressed("move_right"):
		velocity.x += move_speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= move_speed
	
	# Apply gravity -> downward velocity
	velocity.y += gravity * delta
	
	# jump on the next frame
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed
	
	# move player
	velocity = move_and_slide(velocity, Vector2.UP)
