extends Area2D
var boxAccessible = false
export(PackedScene) var box_menu_scene

func _on_box_body_entered(body):
	if body.name == "player":
		boxAccessible = true

func _on_box_body_exited(body):
	if body.name == "player":
		boxAccessible = false

func _input(_event):
	if Input.is_action_just_pressed("up") and boxAccessible:
		var menu = box_menu_scene.instance()
		add_child(menu)
