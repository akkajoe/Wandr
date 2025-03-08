extends Area2D

#func _on_body_entered(body):
	#if body.name == "player":
		#$AnimatedSprite2D.play("animated")
#
#func _on_body_exited(body):
	#if body.name == "player" or body.is_in_group("player"):
		#$AnimatedSprite2D.play("idle")
