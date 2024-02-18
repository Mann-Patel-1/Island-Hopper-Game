extends Actor

@export var score: int 
@export var is_going_left := true

func _ready() -> void:
	if is_going_left:
		max_speed = abs(max_speed)
		$Sprite2D.flip_h = false
	else:
		max_speed = -abs(max_speed)
		$Sprite2D.flip_h = true

func _physics_process(delta) -> void: 
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_wall():
		max_speed *= -1
		$Sprite2D.flip_h = !$Sprite2D.flip_h
	velocity.x = -max_speed
	
	move_and_slide()
	

func _on_hit_area_body_entered(body) -> void:
	if body.has_method("die"):
		print("Player Dead")
		body.die()

func die():
	GameData.score += score
	queue_free()
