extends Node2D

func _ready():
	if playerstats.previousScene == "test1":
		playerstats.facingRight = false
		$"/root/main/startingpoint".position = (Vector2(267, 233))
	elif playerstats.previousScene == "test3":
		playerstats.facingRight = true
		$"/root/main/startingpoint".position = (Vector2(39, 233))
		
	$"/root/main/scenetransition".sceneName = "test3"
	$"/root/main/scenetransition2".sceneName = "test1"
	playerstats.previousScene = "test2"
