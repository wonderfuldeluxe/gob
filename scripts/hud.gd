extends CanvasLayer

func _update_hud():
	$healthbar.max_value = playerstats.maxhealth
	$healthbar.value = playerstats.health

func _input(_event):
	if Input.is_action_just_pressed("print1"):
		var item1 = playerstats.equippedItems[0]
		var item2 = playerstats.equippedItems[1]
		var item3 = playerstats.equippedItems[2]
		var item4 = playerstats.equippedItems[3]
		$Label.text = playerstats.equippedItems[0] + playerstats.itemCount[item1] as String\
		+ " " + playerstats.equippedItems[1] + playerstats.itemCount[item2] as String\
		+ " " + playerstats.equippedItems[2] + playerstats.itemCount[item3] as String\
		+ " " + playerstats.equippedItems[3] + playerstats.itemCount[item4] as String
		
