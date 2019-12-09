extends KinematicBody2D

var speed = 200
var rotation_speed = 1.5
var velocity = Vector2()
var rotation_dir = 0
var MissleOBJ = preload("res://MissleRoot.tscn")

func get_input():
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1
	if Input.is_action_pressed('ui_down'):
		velocity -= transform.x * speed
	if Input.is_action_pressed('ui_up'):
		velocity += transform.x * speed
#Shooting & Creation of projectile
	if Input.is_action_pressed("ui_accept"):
		if($CoolDown.time_left == 0):
			var missle = MissleOBJ.instance()
			missle.position = $Position2D.global_position
			missle.rotation = $Position2D.global_rotation
			get_parent().add_child(missle) # don't want bullet to move with me, so add it as child of parent
			$CoolDown.start()

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		print(collision.collider_id)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
			self.kill()
			
func kill():
	get_tree().reload_current_scene()