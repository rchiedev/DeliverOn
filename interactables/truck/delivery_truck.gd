extends Interactable

func set_package_request():
	current_package = randi_range(0,3)
	package.set_current_package(current_package)
	package.visible = true

func receive_package():
	if !player.has_package() and current_package != -1:
		print("Received a package to deliver!")
		player.pick_up_package(current_package)
		current_package = -1
		timer.start(1.0)
		particle.emitting = true
		audio_player.play()
		package.visible = false
	else:
		print("Player already have a package!")

