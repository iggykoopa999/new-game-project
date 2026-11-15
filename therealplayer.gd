extends CharacterBody2D

func _physics_process(delta):
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * 200
		move_and_slide()

var DeadGuy_count = 0



func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("dead guy") and not $HeldDeadGuy.visible:
		area.queue_free()
		$HeldDeadGuy.visible = true
		
	if area.is_in_group("Cave") and $HeldDeadGuy.visible:
		$HeldDeadGuy.visible = false
		DeadGuy_count +=1
		$CanvasLayer/DeadGuyDisplay.text = "DeadGuy: " + str(DeadGuy_count)
