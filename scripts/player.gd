class_name Player
extends KinematicBody2D

export var gravity: int = 400
export var speed: int = 100
export var jump: int = 150
var damaged = false
var transition = false
var canCling = true
var isntfalling = true
var input_direction_x: float

var velocity = Vector2.ZERO

func _ready():
	hide()
	build_item_list()
	if playerstats.facingRight == true:
		$AnimatedSprite.flip_h = false
	elif playerstats.facingRight == false:
		$AnimatedSprite.flip_h = true
	print(playerstats.itemList)
	print(playerstats.equippedItems)
	
func _start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	#connect("itemEquipped", self, "on_equip")
#	$"/root/main/CanvasLayer/ingamemenu".equip(0, playerstats.equippedItems[0])
#	$"/root/main/CanvasLayer/ingamemenu".equip(1, playerstats.equippedItems[1])
#	$"/root/main/CanvasLayer/ingamemenu".equip(2, playerstats.equippedItems[2])
#	$"/root/main/CanvasLayer/ingamemenu".equip(3, playerstats.equippedItems[3])
#	for i in playerstats.equippedItems: 
#		on_equip(i, playerstats.equippedItems[i])
	
func _die():
	var _temp = get_tree().reload_current_scene()

func build_item_list():
	for i in $"/root/playerstats/items".get_children():
		playerstats.itemList[i.name] = i.name

#func on_equip(slot, item):
#	pass

func _on_iframes_timeout():
	set_collision_layer_bit(1, true)
	set_collision_mask_bit(1, true)
	modulate.a = 1
	
func _invul():
	set_collision_layer_bit(1, false)
	set_collision_mask_bit(1, false)
	$iframes.start()
	modulate.a = 0.5
	
func _input(_event):
	input_direction_x = (Input.get_action_strength("move_right")
	- Input.get_action_strength("move_left"))
#	if Input.is_action_just_pressed("print1"):
#		print(playerstats.equippedItems[1])
	
func _physics_process(delta):
	velocity.y += gravity * delta
	#velocity.x = speed * input_direction_x
	velocity = move_and_slide(velocity, Vector2.UP)
	
#func _process(_delta):
#	if playerstats.health <= 0:
#		_die()

#func update_equip():
#	pass

func _on_reflectbox_area_entered(area):
	if area.is_in_group("projectile"):
		area.reflected = true

func _on_transitiondelay_timeout():
	transition = true

func _on_wallclingdelay_timeout():
	canCling = true
