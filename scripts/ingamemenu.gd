extends Popup

onready var player = $"/root/main/player"
var alreadyPaused
var selectedMenu
var canPause = true
var pausedelay

func change_menu_color():
	$unpause.modulate.a = 0.2
	$restart.modulate.a = 0.2
	$temp2.modulate.a = 0.2
	$exit.modulate.a = 0.2

	match selectedMenu:
		0:
			$unpause.modulate.a = 1
		1:
			$restart.modulate.a = 1
		2:
			$temp2.modulate.a = 1
		3:
			$exit.modulate.a = 1

func _input(_event):
	if !visible:
		if Input.is_action_just_pressed("menu") and !pausedelay and canPause:
			get_tree().paused = true
			selectedMenu = 0
			change_menu_color()
			player.set_process_input(false)
			popup()
			
	else:
		if Input.is_action_just_pressed("down"):
			selectedMenu = (selectedMenu + 1) % 4;
			change_menu_color()
		elif Input.is_action_just_pressed("up"):
			if selectedMenu > 0:
				selectedMenu -= 1
			else:
				selectedMenu = 3
			change_menu_color()
		elif Input.is_action_just_pressed("item1"):
			match selectedMenu:
				0:
					hide()
					pausedelay = true
					$unpausetimer.start()
				1:
					var _temp = get_tree().change_scene("res://Scenes/main.tscn")
					get_tree().paused = false
				2:
					var _temp = get_tree().change_scene("res://Scenes/mainmenu.tscn")
					get_tree().paused = false
				3:
					get_tree().quit()
	
func _on_unpausetimer_timeout():
	pausedelay = false
	if !alreadyPaused:
		get_tree().paused = false
		player.set_process_input(true)
