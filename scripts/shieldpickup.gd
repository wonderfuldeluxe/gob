extends Area2D

export(PackedScene) var shield_scene

func _on_shieldpickup_body_entered(body):
	if body.name == "player":
		var shield = shield_scene.instance()
		$"/root/playerstats/items".add_child(shield)
		$"/root/main/player".build_item_list()
		queue_free()
		playerstats.itemCount["shield"] = 1
