extends State


@export var idle_state: State
@export var death_state: State
@export var run_state: State

@onready var player = get_tree().get_first_node_in_group("player")

var keep_running : bool = true

func enter() -> void:
	super()

	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = move_speed
	var direction = 0
	if player.global_position.x - self.global_position.x > 0:
		direction = 1
	else:
		direction = -1
	
	movement *= direction
	
	if movement != 0:
		if movement < 0:
			parent.get_node("AnimatedSprite2D").flip_h = true
		else:
			parent.get_node("AnimatedSprite2D").flip_h = false
	else:
		return idle_state
	
	
		parent.velocity.x = movement
	parent.move_and_slide()
		
	return null

func process_frame(delta: float) -> State:
	
	return null

		
