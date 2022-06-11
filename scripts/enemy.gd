extends KinematicBody2D

export var speed = 50
var velocity = Vector2.ZERO
var arriveda = false
var arrivedb = true
export(PackedScene) var beam_scene
var health: int = 5

func _ready():
	add_to_group("enemy")

func _shoot():
	$beamcooldown.start()

func _on_hitbox_body_entered(body):
	if body.name == "player":
		playerstats.health -= 5
		body.damaged = true

func _on_visionrange_body_entered(body):
	if body.name == "player":
		set_physics_process(false)
		velocity.x = 0
		_shoot()

func _on_visionrange_body_exited(body):
	if body.name == "player":
		set_physics_process(true)
		$beamcooldown.stop()

func _on_beamcooldown_timeout():
	var _beamspawn  = position
	var beam = beam_scene.instance()
	add_child(beam)

func _process(_delta):
	if health <= 0:
		queue_free()

#func _physics_process(_delta):
#	velocity.x = 0
#
#	var patrola = $"/root/main/patrola".position.x
#	var patrolb = $"/root/main/patrolb".position.x
#
#	if position.x > patrola and not arriveda:
#		velocity.x -= speed
#	if position.x <= patrola:
#		arriveda = true
#		arrivedb = false
#	if position.x < patrolb and not arrivedb:
#		velocity.x += speed
#	if position.x >= patrolb:
#		arriveda = false
#		arrivedb = true
		
	velocity = move_and_slide(velocity, Vector2.UP)
