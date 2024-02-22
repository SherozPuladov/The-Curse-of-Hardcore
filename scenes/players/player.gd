extends CharacterBody2D

class_name Player

signal respawn_player
signal send_cause_of_dead_message(m: String)

@export var items_manager: ItemsManager
@export var speed = 300.0
@export var jump_velocity = -400.0

@export var up_multiplier: float = 2
@export var down_multiplier: float = 10

var can_move: bool = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not can_move:
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	elif Input.is_action_just_pressed("jump") and items_manager.double_jump > 0:
		velocity.y = jump_velocity
		items_manager.double_jump -= 1
	
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

	if position.y > 400:
		respawn_player.emit()
		send_cause_of_dead_message.emit("Dropped out")


func _handle_up():
	if Input.is_action_just_pressed("up"):
		gravity /= up_multiplier
	if Input.is_action_just_released("up"):
		gravity *= up_multiplier


func _handle_down():
	if Input.is_action_just_pressed("down"):
		gravity *= down_multiplier
	if Input.is_action_just_released("down"):
		gravity /= down_multiplier


func kill():
	get_tree().paused = true
	can_move = false
