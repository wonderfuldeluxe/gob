extends PlayerState

func enter(_msg := {}) -> void:
	player.gravity = 0
	player.velocity = Vector2.ZERO
	sprite.play("wallcling")

func physics_update(_delta: float) -> void:
	if player.damaged:
		player.gravity = 400
		state_machine.transition_to("damaged")
	if Input.is_action_just_pressed("jump") and player.canCling:
		player.canCling = false
		player.gravity = 400
		$"/root/main/player/wallclingdelay".start(0.5)
		state_machine.transition_to("jumping", {do_jump = true})
