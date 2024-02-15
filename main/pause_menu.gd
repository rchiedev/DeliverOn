extends Panel

var disabled : bool = false

func _ready():
	self.visible = false


func _process(delta):
	if Input.is_action_just_pressed("pause") and !disabled:
		on_game_paused()

func on_game_paused():
	self.visible = !self.visible
	get_tree().paused = !get_tree().paused


func _on_resume_pressed():
	self.on_game_paused()


func _on_reset_game_pressed():
	on_game_paused()
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	on_game_paused()
	get_tree().change_scene_to_packed(GameManager.main_menu_scene)


func _on_exit_game_pressed():
	get_tree().quit()
