extends Area2D


func _on_Area2D_mouse_entered():
	print("hui")
	# Dim the sprite by reducing the alpha of its modulate property

# Called when the mouse exits the Area2D
func _on_Area2D_mouse_exited():
	# Reset the sprite to full opacity
	print("pizda")
