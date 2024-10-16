extends CharacterBody2D

var health = 1
var player 

func _ready():
	player = get_node("/root/Game/Player")
	if player:
		print("Player node found:", player)
	else:
		print("Player node not found.")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide() 

func take_damage():
	health -= 1
	if health == 0:
		queue_free()
