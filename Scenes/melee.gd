extends State

@export var death_state: State
@export var idle_state: State

@export var TimerMax = 10
@onready var player = get_tree().get_first_node_in_group("player")

var time = 10


func enter() -> void:
	super()
	parent.velocity.x = 0
	

	

func process_frame(delta: float) -> State:
	if time > 0:
		time -= delta
	else:
		time = TimerMax
	
	if time <= 0:
		return idle_state
	
	return null
