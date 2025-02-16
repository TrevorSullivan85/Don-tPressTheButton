extends State

@onready var death_timer: Timer = $deathTimer


func enter() -> void:
	super()
	death_timer.start()
	


func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()
