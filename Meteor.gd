extends Node2D

var HitCount = 3
var BigExplosionOBJ = preload("res://BigExplosion.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	_process(true)

func _process(delta):
	if HitCount == 0:
		var explosion = BigExplosionOBJ.instance()
		explosion.position = self.get_position()
		get_parent().add_child(explosion)
		queue_free()

func kill():
	HitCount = HitCount - 1