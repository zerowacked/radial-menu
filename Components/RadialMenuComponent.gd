extends Node2D

@onready var sprite = preload("res://GUI Icons/icon_sprite.tscn")
@onready var selectorFrame = preload("res://GUI Icons/selector_frame.tscn")
var amountOfIconsToPopulate = randi_range(1,6)
var icons = []
var positions = []

func _ready():
	initialize_selector_frame()
	for i in range(0,5):
		var degrees = calculate_degrees(5)
		var angle = convert_degrees_to_radians(degrees*i)
		var iconPosition = calculate_icon_render_position(angle)
		instantiate_and_draw_icon(iconPosition)

func _process(_delta):
	if Input.is_action_just_pressed("ui_right"):
		rotate_icons_right()
	if Input.is_action_just_pressed("ui_left"):
		rotate_icons_left()

func calculate_degrees(numberOfIcons):
	var degreesToReturn = 360 / numberOfIcons
	return degreesToReturn

func convert_degrees_to_radians(degreesInput):
	return deg_to_rad(degreesInput)

func calculate_icon_render_position(radianInput):
	var renderPosition = (Vector2(sin(radianInput), -cos(radianInput)).normalized()) * 100
	positions.push_back(renderPosition)
	return renderPosition

func instantiate_and_draw_icon(drawLocation):
	var newIcon = sprite.instantiate()
	add_child(newIcon)
	newIcon.position = drawLocation
	icons.push_back(newIcon)

func rotate_icons_right() -> void:
	var last_icon = icons.pop_back()
	icons.insert(0,last_icon)
	for n in range(0,icons.size()):
		var tween := get_tree().create_tween()
		tween.tween_property(icons[n],"position", positions[n], 0.1)

func rotate_icons_left():
	var first_icon = icons.pop_front()
	icons.insert(icons.size(),first_icon)
	for n in range(0,icons.size()):
		var tween := get_tree().create_tween()
		tween.tween_property(icons[n],"position", positions[n], 0.1)	

func initialize_selector_frame():
	var framePosition = (Vector2(0,-1).normalized() * 100)
	var newSelectorFrame = selectorFrame.instantiate()
	add_child(newSelectorFrame)
	newSelectorFrame.position = framePosition
