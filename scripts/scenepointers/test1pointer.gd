extends Node2D

func _ready():
	if playerstats.previousScene == "test2":
		playerstats.facingRight = true
		$"/root/main/startingpoint".position = (Vector2(35, 227))
	elif playerstats.previousScene == "main":
		playerstats.facingRight = false
		$"/root/main/startingpoint".position = (Vector2(197, 227))
	
	$"/root/main/scenetransition".sceneName = "main"
	$"/root/main/scenetransition2".sceneName = "test2"
	playerstats.previousScene = "test1"
	
