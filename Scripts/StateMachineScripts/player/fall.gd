extends State

@export var run_state: State
@export var idle_state: State
@export var death_state: State
@export var jump_state: State
@export var double_jump_state: State

var double_jump := true

func enter() -> void:
	super()
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and not parent.is_on_floor() and double_jump:
		double_jump = false
		return double_jump_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	
	if movement != 0:
		if movement < 0:
			parent.get_node("AnimatedSprite2D").flip_h = true
			parent.get_node("AnimatedSprite2D").offset.x = -18
		else:
			parent.get_node("AnimatedSprite2D").flip_h = false
			parent.get_node("AnimatedSprite2D").offset.x = 0
	parent.velocity.x = movement 
	parent.move_and_slide()
	
	if parent.is_on_floor():
		double_jump = true
		if movement != 0:
			return run_state
		return idle_state
		
	return null

# For not allowing double jump if double jump happened during jump state
func _on_jump_double_jump_used() -> void:
	double_jump = false
	pass # Replace with function body.
