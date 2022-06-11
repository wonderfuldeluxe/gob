extends Node2D

var selectedMenu

func _ready():
	selectedMenu = 0

func _move_cursor():
	match selectedMenu:
		0:
			$cursor.set_position(Vector2(135, 160))
		1:
			$cursor.set_position(Vector2(135, 200))
		2:
			$cursor.set_position(Vector2(135, 240))
			
func _input(_event):
	if Input.is_action_just_pressed("down"):
		selectedMenu = (selectedMenu + 1) % 3;
		_move_cursor()
	elif Input.is_action_just_pressed("up"):
		if selectedMenu > 0:
			selectedMenu -= 1
		else:
			selectedMenu = 2
		_move_cursor()
	elif Input.is_action_just_pressed("item1"):
		match selectedMenu:
			0:
				var _temp = get_tree().change_scene("res://Scenes/main.tscn")
			1:
				print("loadgame")
			2:
				get_tree().quit()
