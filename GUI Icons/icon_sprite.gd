extends Node2D

signal selected

enum SELECT_STATE{
	SELECTED,
	NOT_SELECTED
}

func _ready():
	pass

func _enter_tree():
	pass

func _on_icon_collision_area_area_entered(_area):
	pass
	#print(area.get_parent().get_parent())
