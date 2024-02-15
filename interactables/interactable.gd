class_name Interactable
extends Area2D

@onready var sprite = $Sprite2D
@onready var package = $Package
@onready var timer = $Timer
@onready var particle = $CPUParticles2D
@onready var audio_player = $AudioStreamPlayer2D

var current_package : int = -1
var can_receive : bool = false
var player : Player

func _ready():
	package.visible = false
	set_package_request()

func _process(delta):
	if Input.is_action_just_pressed("interact") and can_receive:
		receive_package()

func _on_body_entered(body):
	if body is Player:
		player = body
		can_receive = true

func _on_body_exited(body):
	if body is Player:
		can_receive = false

func set_package_request():
	pass

func receive_package():
	pass

func _on_timer_timeout():
	set_package_request()
