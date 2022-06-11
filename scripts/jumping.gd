extends PlayerState

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.jump
	if player.velocity.y < 0:
		sprite.play("jump")
	player.isntfalling = true


func physics_update(_delta: float) -> void:
	if player.isntfalling == true and player.velocity.y > 0:
		$"/root/main/player/transitiondelay".start(0.5)
		player.isntfalling = false
		player.velocity.x = 0
		
	if player.transition == true and player.isntfalling == false:
		sprite.play("fall")
		
	if Input.is_action_pressed("move_right"):
			player.velocity.x = player.speed
			sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
			player.velocity.x = -player.speed
			sprite.flip_h = true
	
#	var input_direction_x: float = (
#		Input.get_action_strength("move_right")
#		- Input.get_action_strength("move_left")
#	)

#	player.velocity.x = player.speed * input_direction_x
#	player.velocity.y += player.gravity * delta
	#player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if player.damaged == true:
		state_machine.transition_to("damaged")
	if player.is_on_floor():
		state_machine.transition_to("idle")
#		if is_equal_approx(player.velocity.x, 0):
#			state_machine.transition_to("idle")
#		else:
#			state_machine.transition_to("walking")
	if Input.is_action_just_pressed("item1"):
			get_node("/root/playerstats/items/" + playerstats.equippedItems[0]).fire()
	if Input.is_action_just_pressed("item2"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[1]).fire()
		if Input.is_action_just_pressed("item3"):
			get_node("/root/playerstats/items/" + playerstats.equippedItems[2]).fire()
	if Input.is_action_just_pressed("item4"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[3]).fire()
