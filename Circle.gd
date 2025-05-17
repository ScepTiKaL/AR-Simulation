extends Node2D


func _draw():
	draw_arc(get_viewport().get_size()/2,get_parent().get_parent().mouse_radius,0,2*PI,5,Color.white)
