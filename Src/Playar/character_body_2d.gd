extends CharacterBody2D

@export var speed := 150.0

@onready var animated_sprite: AnimatedSprite2D = $Sprite

var last_direction := "s"

func _physics_process(_delta):
	var direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:

		if abs(direction.x) > abs(direction.y):
			# Horizontal
			if direction.x > 0:
				last_direction = "d"
				animated_sprite.flip_h = false
			else:
				last_direction = "d"
				animated_sprite.flip_h = true

		else:
			# Vertical
			if direction.y < 0:
				last_direction = "w"
			else:
				last_direction = "s"

			animated_sprite.flip_h = false

		animated_sprite.play("WALK-" + last_direction)

	else:
		animated_sprite.play("IDLE-" + last_direction)
