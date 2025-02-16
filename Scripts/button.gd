extends AnimatedSprite2D


@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "on_interact")

func on_interact():
	self.play("pressed")
	print("button pressed!")
