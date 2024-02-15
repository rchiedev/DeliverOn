extends Node2D

@onready var player_spawn = $PlayerSpawn
var player_scene := preload("res://player/player.tscn")
@onready var game_timer = %GameTimer
@onready var timer = $Timer
@onready var score_label = %ScoreLabel
@onready var game_over_screen = %GameOverScreen
@onready var pause_menu = %PauseMenu

var score : int = 0
var player : Player

func _ready():
	player = player_scene.instantiate()
	player.global_position = player_spawn.global_position
	add_child(player)
	
	GameManager.on_player_delivered.connect(add_score)
	score = 0
	score_label.text = "0"
	

func _process(delta):
	game_timer.text = str(snappedf(timer.time_left, 0.1))

func _on_respawn_area_body_entered(body):
	body.global_position = player_spawn.global_position

func add_score():
	score = score + 150
	score_label.text = str(score)

func _on_timer_timeout():
	print("Game is over!")
	GameManager.set_highscore(score)
	player.disable_movement()
	game_over_screen.visible = true
	game_over_screen.set_score(score)
	pause_menu.disabled = true

func on_pause_pressed():
	pause_menu.on_game_paused()
