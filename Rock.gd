extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var BigExplosionOBJ = preload("res://BigExplosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func kill():
	var explosion = BigExplosionOBJ.instance()
	explosion.position = self.get_position()
	get_parent().add_child(explosion)
	queue_free()
	