extends Area2D

export(PackedScene) var spike_scene

func _on_spikepickup_body_entered(body):
	if body.name == "player":
		var spike = spike_scene.instance()
		$"/root/playerstats/items".add_child(spike)
		$"/root/main/player".build_item_list()
		queue_free()
		playerstats.itemCount["spike"] = 5
