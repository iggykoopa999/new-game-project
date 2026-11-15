extends CharacterBody2D

func _physics_process(delta):
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * 600
		move_and_slide()

var DeadGuy_count = 0



func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("dead guy") and not $HeldDeadGuy.visible:
		area.queue_free()
		$HeldDeadGuy.visible = true
		
	if area.is_in_group("Cave") and $HeldDeadGuy.visible:
		$HeldDeadGuy.visible = false
		DeadGuy_count +=1
		$CanvasLayer/DeadGuyDisplay.text = "Score : " + str(DeadGuy_count)

@onready var _animated_sprite = $AnimatedSprite2D

func _process(delta):
	# Get movement vector from input
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		# Play run animation when moving
		_animated_sprite.play("Run")
	else:
		# Stop animation when idle
		_animated_sprite.stop()
