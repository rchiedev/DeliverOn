extends Panel

@onready var highscore_label = $HighscoreLabel

func _ready():
	highscore_label.text = "Highscore\n" + str(GameManager.highscore)

func _on_new_game_pressed():
	get_tree().change_scene_to_packed(GameManager.game_scene)

func _on_exit_game_pressed():
	get_tree().quit()


