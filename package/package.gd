class_name Package
extends Sprite2D

const package_list : Array = [
	{
		"texture" = preload("res://assets/tile_0092.png"),
	},
	{
		"texture" = preload("res://assets/tile_0103.png"),
	},
	{
		"texture" = preload("res://assets/tile_0104.png"),
	},
	{
		"texture" = preload("res://assets/tile_0106.png"),
	},
	{
		"texture" = preload("res://assets/trash.png"),
	}
]

@onready var current_package = $CurrentPackage

var package_id : int

func set_current_package(id):
	package_id = id
	current_package.texture = package_list[package_id]["texture"]
	if id == 4:
		current_package.set_scale(Vector2(0.3, 0.3))
	else:
		current_package.set_scale(Vector2(15,15))
	
