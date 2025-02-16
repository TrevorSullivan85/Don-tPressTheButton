extends State

@export var run_state: State
@export var idle_state: State
@export var death_state: State
@export var fall_state: State

@export var jump_force: float = 900.0


func enter() -> void:
	super()
	parent.velocity.y = -jump_force
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	
	if movement != 0:
		parent.get_node("AnimatedSprite2D").flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	return null
		
