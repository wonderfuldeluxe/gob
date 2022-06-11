extends Node

func fire():
	if $"/root/main/player".is_on_floor():
		$"/root/main/player".velocity.x = 0
		$"/root/main/player/statemachine".transition_to("reflect")
	else:
		print("not on floor")
