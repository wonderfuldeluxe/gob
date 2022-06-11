extends KinematicBody2D

var velocity = Vector2.ZERO
var isflying = false
var isIdle = true
var flightTimer = Timer.new()

func _ready():
	add_child(flightTimer)
	flightTimer.connect("timeout", self, "_on_flightTimer_timeout")
	flightTimer.one_shot = true
	add_to_group("bat")

func _on_vision_area_entered(area):
	if area.name == "reflectbox" and isIdle == true:
		isIdle = false
		var playerposition = $"/root/main/player".position.x
		$AnimatedSprite.play("fly")
		isflying = true
		if playerposition > position.x: 
			$AnimatedSprite.flip_h = true
			velocity.x -= 100
		if playerposition <= position.x:
			velocity.x += 100
			$AnimatedSprite.flip_h = false
		flightTimer.start(1)
		
func _on_flightTimer_timeout():
	isflying = false
	
func _physics_process(_delta):
	if isflying == true:
		velocity.y += rand_range(-3, 2)
	if isflying == false and is_on_ceiling():
		isIdle = true
		velocity = Vector2.ZERO
		$AnimatedSprite.play("idle")
	if is_on_wall() or is_on_floor():
		velocity.y -= 4
		if $AnimatedSprite.flip_h == false:
			$AnimatedSprite.flip_h = true
			velocity.x -= 100
		else:
			$AnimatedSprite.flip_h = false
			velocity.x += 100
		
	velocity = move_and_slide(velocity, Vector2.UP)
