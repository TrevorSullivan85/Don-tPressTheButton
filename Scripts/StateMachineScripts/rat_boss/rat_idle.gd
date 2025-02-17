extends State

@export var run_state: State
@export var death_state: State


@onready var player = get_tree().get_first_node_in_group("player")

var run: bool = false


func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.get_node("idleTimer").start()
	
	
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	if run:
		return run_state
	return null

	


func _on_idle_timer_timeout() -> void:
	print("Start running")
	run = true
	print("Timer done")
