extends Node2D

func _ready():
	if playerstats.previousScene == "test2":
		playerstats.facingRight = false
		$"/root/main/startingpoint".position = (Vector2(267, 233))
	elif playerstats.previousScene == "main":
		playerstats.facingRight = true
		$"/root/main/startingpoint".position = (Vector2(39, 233))
		
	$"/root/main/scenetransition".sceneName = "main"
	$"/root/main/scenetransition2".sceneName = "test2"
	playerstats.previousScene = "test3"
