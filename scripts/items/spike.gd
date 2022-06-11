extends Node

func fire():
	if !$"/root/main/player".is_on_floor():
		if $"/root/main/player".is_on_wall():
			if playerstats.itemCount["spike"] > 0:
				playerstats.itemCount["spike"] -= 1
				$"/root/main/player/statemachine".transition_to("wallcling")
			else:
				print("outta spikes")
		else:
			print("too far from wall")
	else:
		print("on the ground")
