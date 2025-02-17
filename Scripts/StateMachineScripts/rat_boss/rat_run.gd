extends State


@export var idle_state: State
@export var death_state: State

@onready var player = get_tree().get_first_node_in_group("player")

var keep_running : bool = true

func enter() -> void:
	super()
	parent.get_node("runningTimer").start()

	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = move_speed
	var direction = 0
	print(keep_running)
	if keep_running:
		print(player.global_position.x - parent.global_position.x < 65 and player.global_position.x - parent.global_position.x > -65)
		if player.global_position.x - parent.global_position.x < 65 and player.global_position.x - parent.global_position.x > -65:
			direction = 0
		elif player.global_position.x - parent.global_position.x > 0:
			direction = 1
		else:
			direction = -1
		movement *= direction
	else:
		movement = 0;
	print(player.global_position.y)
	print(movement)
	if movement != 0 or player.global_position.y < -5:
		if movement < 0:
			parent.get_node("AnimatedSprite2D").flip_h = true
		else:
			parent.get_node("AnimatedSprite2D").flip_h = false
	else:
		print("Idle State Started")
		return idle_state
	
	
	parent.velocity.x = movement
	parent.move_and_slide()
		
	return null

func process_frame(delta: float) -> State:
	
	return null

		


func _on_running_timer_timeout() -> void:
	keep_running = false
