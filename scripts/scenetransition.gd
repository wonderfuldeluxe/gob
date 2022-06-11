extends Area2D

var sceneName

func _on_scenetransition_body_entered(body):
	if body.name == "player" and !$"/root/main/player".damaged:
		change_scene(sceneName)
	
func change_scene(sceneName):
	var _temp = get_tree().change_scene("res://Scenes/" + sceneName + ".tscn")
