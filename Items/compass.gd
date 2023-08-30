extends Node2D

@onready var effect = preload("res://Items/Assets/Resource/compass_test_effect.tscn")

signal selected
signal item_used

enum SELECT_STATE{SELECTED,NOT_SELECTED}

@export var menu_state:SELECT_STATE = SELECT_STATE.NOT_SELECTED
@export var quantity : int = 0
@export var itemId : int = 1

func _on_area_2d_area_entered(_area) -> void:
	menu_state = SELECT_STATE.SELECTED

func _on_area_2d_area_exited(_area) -> void:
	menu_state = SELECT_STATE.NOT_SELECTED

func item_action() -> void:
	if menu_state == SELECT_STATE.SELECTED:
		var new_effect = effect.instantiate()
		add_child(new_effect)
	else:
		pass
