extends CharacterBody2D

var DeadGuy_count = 0

var speed = 500


func _ready():
	velocity = Vector2 (-200,200).normalized() * speed
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())


var has_eaten: bool = false

func _on_pickup_area_area_entered(area: Area2D) -> void:
	if has_eaten:
		return
		
	if area.is_in_group("barriers"):
		has_eaten = true
		
		for child in area.get_children():
			if child is Sprite2D:
				child.hide()
			elif child is CollisionShape2D:
				child.queue_free()
		queue_free()
	elif area.name == "Cave3":
		var screen = get_tree().current_scene.find_child("game_over", true, false)
		if screen:
			screen.visible = true
@onready var timer = $Timer


func duplicate_player():
	
	var clone = self.duplicate()
	
	add_to_group("player_clones", clone)
	
	# Move it to a new location
	clone.position = Vector2(
		clone.position.x + 200,  # move right by 200 pixels
		clone.position.y
	)
