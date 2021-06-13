extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var move_speed := 100
export var gravity := 2000
export var jump_speed := 550

export var spawn_platform = Vector2.ZERO

export var last_floor_level := 0

var velocity := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_animation()

func change_animation():
	# face left or right
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = true
	if velocity.y < 0:
		$AnimatedSprite.play("jump")
	else:
		if velocity.x != 0:
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")

func _physics_process(delta):
	# reset horizontal velocity
	velocity.x = 0
	if self.is_on_floor():
		spawn_platform.y = self.position.y +21
		spawn_platform.x = self.position.x
	
	if position.y >= 270:
		 dies()
		 position = Vector2.ZERO
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

func dies():
	spawn_platform.x = 0.25 * spawn_platform.x + 0.75* self.position.x
	get_node("/root/Game").add_Bulle(spawn_platform)
