extends State

@export var run_state: State
@export var death_state: State
@export var front_melee_state: State
@export var back_melee_state: State
@export var missile_state: State

@onready var player = get_tree().get_first_node_in_group("player")

var front_melee : bool = false
var back_melee : bool = false
var missile : bool = false


func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.get_node("idleTimer").start()
	
	
	
func process_physics(delta:float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
		
	return null
	
func process_frame(delta:float) -> State:
	if front_melee:
		return front_melee_state
	elif back_melee:
		return back_melee_state
	elif missile:
		return missile_state
	return null
	

# funcs to check if player is in range of quick melee attacks
func _on_front_melee_body_entered(body: Node2D) -> void:
	front_melee = true
func _on_front_melee_body_exited(body: Node2D) -> void:
	front_melee = false
func _on_back_melee_body_entered(body: Node2D) -> void:
	back_melee = true
func _on_back_melee_body_exited(body: Node2D) -> void:
	back_melee = true

	


func _on_idle_timer_timeout() -> void:
	missile = true
