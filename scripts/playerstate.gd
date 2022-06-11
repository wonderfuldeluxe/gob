class_name PlayerState
extends State

var player: Player
onready var sprite = $"/root/main/player/AnimatedSprite"

func _ready() -> void:
	yield(owner, "ready")
	player = owner as Player
	assert(player != null)
