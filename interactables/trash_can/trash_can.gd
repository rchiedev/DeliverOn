extends Interactable

func set_package_request():
	current_package = 4
	package.set_current_package(current_package)
	package.visible = true

func receive_package():
	if player.has_package():
		particle.emitting = true
		player.remove_package()
		audio_player.play()
