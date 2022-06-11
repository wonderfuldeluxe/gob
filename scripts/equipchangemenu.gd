extends CanvasLayer

onready var player = $"/root/main/player"
onready var items = $"/root/playerstats/items"
var selectedMenu
export var currentlyEquipped1: int
export var currentlyEquipped2: int
export var currentlyEquipped3: int
export var currentlyEquipped4: int
var itemlistsize
var menu
var pausedelay

func _ready():
	itemlistsize = playerstats.itemList.size()
	get_tree().paused = true
	selectedMenu = 0
	currentlyEquipped1 = playerstats.currentlyEquipped1
	currentlyEquipped2 = playerstats.currentlyEquipped2
	currentlyEquipped3 = playerstats.currentlyEquipped3
	currentlyEquipped4 = playerstats.currentlyEquipped4
	update_menu()
	player.set_process_input(false)
	menu = 0
	$"/root/main/CanvasLayer/ingamemenu".canPause = false

func update_menu():
	$equipped1.play(playerstats.itemList[items.get_child(currentlyEquipped1).name])
	$equipped2.play(playerstats.itemList[items.get_child(currentlyEquipped2).name])
	$equipped3.play(playerstats.itemList[items.get_child(currentlyEquipped3).name])
	$equipped4.play(playerstats.itemList[items.get_child(currentlyEquipped4).name])
	
func move_cursor():
	match selectedMenu:
		0:
			$cursor.set_position(Vector2(16, -86))
		1:
			$cursor.set_position(Vector2(-20, -44))
		2:
			$cursor.set_position(Vector2(52, -44))
		3:
			$cursor.set_position(Vector2(16, -2))
		4:
			$cursor.set_position(Vector2(16, 49))

func _input(_event):
	if Input.is_action_just_pressed("move_right") and menu == 0:
		selectedMenu = 2
		move_cursor()
	if Input.is_action_just_pressed("move_left") and menu == 0:
		selectedMenu = 1
		move_cursor()
	if Input.is_action_just_pressed("down"):
		match menu:
			0:
				if selectedMenu == 3:
					selectedMenu = 4
				elif selectedMenu == 4:
					selectedMenu = 0
				else:
					selectedMenu = 3
				move_cursor()
			1:
				currentlyEquipped1 = (currentlyEquipped1 + 1) % (itemlistsize);
				update_menu()
			2:
				currentlyEquipped2 = (currentlyEquipped2 + 1) % (itemlistsize);
				update_menu()
			3:
				currentlyEquipped3 = (currentlyEquipped3 + 1) % (itemlistsize);
				update_menu()
			4:
				currentlyEquipped4 = (currentlyEquipped4 + 1) % (itemlistsize);
				update_menu()
	if Input.is_action_just_pressed("up"):
		match menu:
			0:
				if selectedMenu == 4:
					selectedMenu = 3
				elif selectedMenu == 0:
					selectedMenu = 4
				else:
					selectedMenu = 0
				move_cursor()
			1:
				if currentlyEquipped1 > 0:
					currentlyEquipped1 -= 1
				else:
					currentlyEquipped1 = (itemlistsize - 1)
				update_menu()
			2:
				if currentlyEquipped2 > 0:
					currentlyEquipped2 -= 1
				else:
					currentlyEquipped2 = (itemlistsize - 1)
				update_menu()
			3:
				if currentlyEquipped3 > 0:
					currentlyEquipped3 -= 1
				else:
					currentlyEquipped3 = (itemlistsize - 1)
				update_menu()
			4:
				if currentlyEquipped4 > 0:
					currentlyEquipped4 -= 1
				else:
					currentlyEquipped4 = (itemlistsize - 1)
				update_menu()
				
	if Input.is_action_just_pressed("item1"):
		if menu == 0:
			match selectedMenu:
				0:
					menu = 1
				1:
					menu = 2
				2:
					menu = 3
				3:
					menu = 4
				4:
					$unpausetimer.start()
					playerstats.currentlyEquipped1 = currentlyEquipped1
					playerstats.currentlyEquipped2 = currentlyEquipped2
					playerstats.currentlyEquipped3 = currentlyEquipped3
					playerstats.currentlyEquipped4 = currentlyEquipped4
					$"/root/main/CanvasLayer/ingamemenu".canPause = true
		else:
			match menu:
				1:
					equip(0, playerstats.itemList[items.get_child(currentlyEquipped1).name])
				2:
					equip(1, playerstats.itemList[items.get_child(currentlyEquipped2).name])
				3:
					equip(2, playerstats.itemList[items.get_child(currentlyEquipped3).name])
				4:
					equip(3, playerstats.itemList[items.get_child(currentlyEquipped4).name])
				
			menu = 0
			
func equip(slot, item):
	playerstats.equippedItems[slot] = playerstats.itemList[item]
	print(slot, item)

func _on_unpausetimer_timeout():
	print("test")
	get_tree().paused = false
	player.set_process_input(true)
	queue_free()
