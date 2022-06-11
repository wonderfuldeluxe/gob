extends PlayerState

func enter(_msg := {}) -> void:
	sprite.play("walk")

func physics_update(_delta: float) -> void:
	if !player.is_on_floor():
		state_machine.transition_to("jumping")
		return

	elif Input.is_action_pressed("move_right"):
			player.velocity.x = player.speed
			sprite.flip_h = false
			$"/root/main/player/reflectbox".position.x = 0
	elif Input.is_action_pressed("move_left"):
			player.velocity.x = -player.speed
			sprite.flip_h = true
			$"/root/main/player/reflectbox".position.x = -45

	#player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	#print (player.velocity)
	#player.velocity.x = clamp(player.velocity.x, -20, 20)
	
	if player.damaged:
		state_machine.transition_to("damaged")
		
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jumping", {do_jump = true})
		
	if Input.is_action_just_pressed("item1"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[0]).fire()
	if Input.is_action_just_pressed("item2"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[1]).fire()
	if Input.is_action_just_pressed("item3"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[2]).fire()
	if Input.is_action_just_pressed("item4"):
		get_node("/root/playerstats/items/" + playerstats.equippedItems[3]).fire()
		
	elif !Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right"):
		state_machine.transition_to("idle")
		
