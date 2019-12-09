extends Node

export (PackedScene) var Mob
var score

func _ready():
    randomize()


func _on_MobTimer_timeout():
    # Choose a random location on Path2D.
    $Path2D/PathFollow2D.set_offset(randi())
    # Create a Mob instance and add it to the scene.
    var mob = Mob.instance()
    add_child(mob)
    # Set the mob's direction perpendicular to the path direction.
    var direction = $Path2D/PathFollow2D.rotation + PI / 2
    # Set the mob's position to a random location.
    mob.position = $Path2D/PathFollow2D.position
    # Add some randomness to the direction.
    direction += rand_range(-PI / 4, PI / 4)
    mob.rotation = direction
    # Set the velocity (speed & direction).
    mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
    mob.linear_velocity = mob.linear_velocity.rotated(direction)
