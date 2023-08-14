extends CharacterBody2D

@onready var sprite = preload("res://GUI Icons/icon_sprite.tscn")
@onready var selectorFrame = preload("res://GUI Icons/selector_frame.tscn")
const degreesAroundPlayer = 360
var icons = [0, 1, 2]


func _ready():
	initialize_selector_frame()
	var numberOfIcons = icons.size()
	for i in range(0,icons.size()):
		var degrees = calculate_degrees(numberOfIcons)
		var angle = convert_degrees_to_radians(degrees*i)
		var iconPosition = calculate_icon_render_position(angle)
		instantiate_and_draw_icon(sprite,iconPosition)

func calculate_degrees(numberOfIcons):
	var degreesToReturn = 360 / numberOfIcons
	return degreesToReturn

func convert_degrees_to_radians(degreesInput):
	return deg_to_rad(degreesInput)

func calculate_icon_render_position(radianInput):
	return (Vector2(sin(radianInput), -cos(radianInput)).normalized()) * 100

func instantiate_and_draw_icon(iconInput,drawLocation):
	var newIcon = iconInput.instantiate()
	add_child(newIcon)
	newIcon.position = drawLocation

func populate_icon():
	pass

func rotate_icons():
	pass

func initialize_selector_frame():
	var framePosition = (Vector2(0,-1).normalized() * 100)
	var newSelectorFrame = selectorFrame.instantiate()
	add_child(newSelectorFrame)
	newSelectorFrame.position = framePosition
