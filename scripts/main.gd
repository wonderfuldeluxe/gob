extends Node2D

export(PackedScene) var playerScene
export(PackedScene) var cameraScene
export(PackedScene) var hudScene
export(PackedScene) var pauseScene
var currentScene
var previousScene

func _ready():
	_start()

func _start():
	var player = playerScene.instance()
	var camera = cameraScene.instance()
	var hud = hudScene.instance()
	var pause = pauseScene.instance()
	add_child(player)
	add_child(hud)
	add_child(pause)
	player._start($startingpoint.position)
	player.add_child(camera)
	$"/root/main/hud"._update_hud()
	
#make camera transitions within zones, add delays for transisions between zones
