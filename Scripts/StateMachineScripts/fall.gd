extends State

@export var run_state: State
@export var idle_state: State
@export var death_state: State
@export var jump_state: State

func enter() -> void:
	super()
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	
	if movement != 0:
		parent.get_node("AnimatedSprite2D").flip_h = movement < 0
	parent.velocity.x = movement 
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return run_state
		return idle_state
		
	return null
		
