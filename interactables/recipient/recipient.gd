extends Interactable

const recipient_sprites : Array = [
	preload("res://assets/tile_0002.png"), 
	preload("res://assets/tile_0004.png"), 
	preload("res://assets/tile_0006.png"), 
	preload("res://assets/tile_0009.png")
]

func _ready():
	super._ready()
	self.sprite.texture = recipient_sprites.pick_random()
	

func set_package_request():
	current_package = randi_range(0,3)
	package.set_current_package(current_package)
	package.visible = true

func receive_package():
	if player.find_package(current_package):
		current_package = -1
		timer.start(randf_range(3.0, 5.0))
		package.visible = false
		particle.emitting = true
		player.on_package_sent()
		audio_player.play()

