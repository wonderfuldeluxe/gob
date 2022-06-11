extends PlayerState

func enter(_msg := {}) -> void:
	$"/root/main/player/reflectbox/CollisionShape2D".disabled = false
	sprite.play("reflect")
	
func update(_delta: float) -> void:
#	player.velocity = Vector2.ZERO
#
#	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if not player.is_on_floor():
		$"/root/main/player/reflectbox/CollisionShape2D".disabled = true
		print ("reflect interrupted (falling)")
		state_machine.transition_to("jumping")
		return
		
	if player.damaged == true:
		$"/root/main/player/reflectbox/CollisionShape2D".disabled = true
		print ("reflect interrupted (damage)")
		state_machine.transition_to("damaged")
		
	if !Input.is_action_pressed("itemkey"):
		$"/root/main/player/reflectbox/CollisionShape2D".disabled = true
		state_machine.transition_to("idle")
