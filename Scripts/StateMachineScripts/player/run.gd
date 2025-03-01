extends State


@export var idle_state: State
@export var jump_state: State
@export var death_state: State
@export var fall_state: State
@export var run_state: State


func enter() -> void:
	super()

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed
	
	if movement == 0:
		return idle_state
	return null
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = move_speed
	var direction = 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1
	
	movement *= direction
	
	if movement != 0:
		if movement < 0:
			parent.get_node("AnimatedSprite2D").flip_h = true
			parent.get_node("AnimatedSprite2D").offset.x = -18
		else:
			parent.get_node("AnimatedSprite2D").flip_h = false
			parent.get_node("AnimatedSprite2D").offset.x = 0
			
		
		parent.velocity.x = movement
		
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
		
	return null

func process_frame(delta: float) -> State:
	
	return null

		
