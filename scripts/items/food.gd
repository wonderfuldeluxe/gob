extends Node

func fire():
	if $"/root/main/player".is_on_floor():
		if playerstats.itemCount["food"] > 0:
			print("yummy")
			playerstats.health += 3
			playerstats.itemCount["food"] -= 1
		else:
			print("no food")
