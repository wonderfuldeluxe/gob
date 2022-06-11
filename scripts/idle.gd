extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	$"/root/main/player/transitiondelay".start(0.2)

func update(_delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("jumping")
		return
	if player.transition == true:
		sprite.play("idle")
		player.transition = false

	if player.damaged == true:
		state_machine.transition_to("damaged")
		
	if Input.is_action_just_pressed("jump"):
		$"/root/main/player/transitiondelay".start(0.5)
		state_machine.transition_to("jumping", {do_jump = true})
		
	if Input.is_action_just_pressed("item1"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[0]).fire()
	if Input.is_action_just_pressed("item2"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[1]).fire()
	if Input.is_action_just_pressed("item3"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[2]).fire()
	if Input.is_action_just_pressed("item4"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[3]).fire()

	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("walking")
