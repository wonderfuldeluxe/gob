extends Area2D

var velocity = Vector2.ZERO
var movingleft
var movingright
var timer = Timer.new()
var reflected = false

func _ready():
	var playerposition = $"/root/main/player".position.x
	var parentposition = $"/root/main/enemy".position.x
	if playerposition < parentposition:
		movingleft = true
	if playerposition >= parentposition:
		movingright = true
	add_to_group("projectile")
	self.add_child(timer)
	timer.connect("timeout", self, "queue_free")
	timer.set_wait_time(3)
	timer.start()

func _on_beam_body_entered(body):
	if body.name == "player" and not reflected:
		playerstats.health -= 5
		body.damaged = true
		queue_free()
	if body.is_in_group("enemy") and reflected:
		body.health -= 5
		queue_free()
		

func _process(delta):
	velocity.x = 0
	var parentvelocity = $"/root/main/enemy".velocity.x
	
	if movingleft == true:
		velocity.x -= 100
	if movingright == true:
		velocity.x += 100

	if parentvelocity > 1:
		velocity.x -= 50
	if parentvelocity < -1:
		velocity.x += 50
		
	if reflected == true:
		velocity.x = velocity.x * -1
	position += velocity * delta

