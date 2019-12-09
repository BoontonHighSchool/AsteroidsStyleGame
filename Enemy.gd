extends RigidBody2D

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.
var mob_types = ["blackk", "blue", "green", "red"]

func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_Visibility_screen_exited():
	queue_free()

func _on_Enemy_body_entered(body):
	if body.has_method("kill"):
		body.kill()


func _on_Enemy_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.has_method("kill"):
		body.kill()

func kill():
	queue_free()