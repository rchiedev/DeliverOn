extends Node

signal on_game_timeout()
signal on_player_delivered()

var highscore : int = 0

var game_scene := preload("res://main/game.tscn")
var main_menu_scene := preload("res://main/main_menu.tscn")

func _ready():
	load_highscore()

func set_highscore(score : int = 0):
	if score > highscore:
		highscore = score
		save_highscore()
		
func save_highscore():
	var file = FileAccess.open("res://save/save.txt", FileAccess.WRITE)
	file.store_line(str(highscore))
	file.close()
	
func load_highscore():
	if FileAccess.file_exists("res://save/save.txt"):
		var file = FileAccess.open("res://save/save.txt", FileAccess.READ)
		highscore = int(file.get_line())
		file.close()
	
