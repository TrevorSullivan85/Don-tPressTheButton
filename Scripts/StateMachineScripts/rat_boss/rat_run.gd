extends State


@export var idle_state: State
@export var death_state: State
@export var front_melee_state: State
@export var back_melee_state: State
@export var missile_state: State

@onready var player = get_tree().get_first_node_in_group("player")

var keep_running : bool = true

var front_melee : bool = false
var back_melee : bool = false
var missile : bool = false

func enter() -> void:
	super()
	parent.get_node("runningTimer").start()
	keep_running = true

	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = move_speed
	var direction = 0
	
	if front_melee:
		return front_melee_state
	
	if keep_running:
	
		if player.global_position.x - parent.global_position.x < 60 and player.global_position.x - parent.global_position.x > -60:
			direction = 0
		elif player.global_position.x - parent.global_position.x > 0:
			direction = 1
		else:
			direction = -1
		movement *= direction
	else:
		return missile_state
	
	print(movement)
	if movement != 0 :
		if movement < 0:
			parent.get_node("AnimatedSprite2D").flip_h = true
		else:
			parent.get_node("AnimatedSprite2D").flip_h = false
	else:
		parent.get_node("AnimatedSprite2D").play("idle")
	
	
	parent.velocity.x = movement
	parent.move_and_slide()
		
	return null

	
		


func _on_running_timer_timeout() -> void:
	print("Run timer done")
	keep_running = false


func _on_front_melee_body_entered(body: Node2D) -> void:
	front_melee = true
	print("Body entered")
func _on_front_melee_body_exited(body: Node2D) -> void:
	front_melee = false
	print("Body exited")
