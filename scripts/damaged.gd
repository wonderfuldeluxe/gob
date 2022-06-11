extends PlayerState

func enter(_msg := {}) -> void:
	player._invul()
	$"/root/main/player/unactionable".start()
	player.velocity = Vector2(-25, -75)
	sprite.play("owie")
#	player.health = $"/root/playerstats".health
	
func physics_update(_delta: float) -> void:
#	player.velocity.y += player.gravity * delta
#	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	pass
	
func _on_unactionable_timeout():
	player.damaged = false
	if player.is_on_floor():
		state_machine.transition_to("idle")
	else:
		state_machine.transition_to("jumping")
		
