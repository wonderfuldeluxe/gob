extends Node

export var health: int = 10 setget sethealth, gethealth
export var maxhealth: int = 10

var equippedItems = ["empty", "empty", "empty", "empty"]
export var currentlyEquipped1: int
export var currentlyEquipped2: int
export var currentlyEquipped3: int
export var currentlyEquipped4: int
var itemList = {}
var itemCount = {"empty": 0}

var previousScene
var facingRight

func sethealth(value):
	print(value)
	value = clamp(value, 0, maxhealth)
	if value <= 0:
		value = maxhealth
		$"/root/main/player"._die()
	health = value
	$"/root/main/hud/healthbar".value = health

func gethealth():
	return health
	
