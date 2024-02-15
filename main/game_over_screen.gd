extends Panel

@onready var game_over_highscore = %GameOverHighscore
@onready var game_over_score = %GameOverScore

func _ready():
	self.visible = false

func set_score(score : int = 0):
	game_over_score.text = "Your Score\n" + str(score)
	game_over_highscore.text = "Highscore\n" + str(GameManager.highscore)
	GameManager.set_highscore(score)

func _on_new_game_pressed():
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().change_scene_to_packed(GameManager.main_menu_scene)

func _on_exit_game_pressed():
	get_tree().quit()
