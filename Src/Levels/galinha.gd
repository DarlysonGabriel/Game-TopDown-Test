extends AnimatedSprite2D

@export var playar: CharacterBody2D
@export var state: AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta: float) -> void:
	if playar.position.x > position.x:
		state.play("D")
		state.flip_h = false
	else:
		state.play("D")
		state.flip_h = true
