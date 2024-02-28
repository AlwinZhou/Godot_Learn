extends CharacterBody2D
var player 
# Called when the node enters the scene tree for the first time.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var chase = false
var speed = 20
func _physics_process(delta):
	velocity.y = gravity*delta*20

	if chase == true:
		get_node("AnimatedSprite2D").play("Jump")
		player = get_node("../../Players/Player")
		var direaction = (player.position - self.position)
		velocity.x = direaction.x * speed* delta
		if direaction.x < 0:
			get_node("AnimatedSprite2D").flip_h = false
		elif direaction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true	 
	else:
		velocity.x = 0
		get_node("AnimatedSprite2D").play("Idel")
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		chase = true
func _on_area_2d_body_exited(body):
	if body.name == "Player":
		chase = false

