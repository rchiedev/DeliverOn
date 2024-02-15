class_name Player
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var package = $Package

const mspd = 150.0
const jump_spd = -300.0

var current_package : int = -1
var can_move : bool = true

func _ready():
	package.visible = self.has_package()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += 980 * delta
	if can_move:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_spd

		var direction = Input.get_axis("move_left", "move_right")
		velocity.x = direction * mspd
	else:
		velocity.x = 0
		
		
	if velocity.length() > 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true

	move_and_slide()

func pick_up_package(id):
	current_package = id
	package.set_current_package(id)
	package.visible = has_package()

func has_package() -> bool:
	if current_package in range(0,4):
		return true
	else:
		return false

func find_package(id) -> bool:
	if current_package == id:
		return true
	else:
		return false

func on_package_sent():
	GameManager.on_player_delivered.emit()
	remove_package()
	
func remove_package():
	current_package = -1
	package.visible = has_package()
	
func disable_movement():
	can_move = false
