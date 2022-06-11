extends Area2D

export(PackedScene) var food_scene

func _on_foodpickup_body_entered(body):
	if body.name == "player":
		var food = food_scene.instance()
		$"/root/playerstats/items".add_child(food)
		$"/root/main/player".build_item_list()
		queue_free()
		playerstats.itemCount["food"] = 3
	
