extends CharacterBody2D

var DeadGuy_count = 0

var speed = 500


func _ready():
	velocity = Vector2 (-200,200).normalized() * speed
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Cave"):
		visible = false
		DeadGuy_count +=1
		$CanvasLayer/DeadGuyDisplay.text = "DeadGuy: " + str(DeadGuy_count)
		queue_free()


@onready var timer = $Timer


func duplicate_player():
	
	var clone = self.duplicate()
	
	add_to_group("player_clones", clone)
	
	# Move it to a new location
	clone.position = Vector2(
		clone.position.x + 200,  # move right by 200 pixels
		clone.position.y
	)
