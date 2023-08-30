extends CharacterBody2D

@onready var sprite = preload("res://GUI Icons/icon_sprite.tscn")
@onready var selectorFrame = preload("res://GUI Icons/selector_frame.tscn")
var amountOfIconsToPopulate = randi_range(1,6)
var icons = []
var positions = []

enum State {
	ACTIVE,
	INACTIVE
}

@export var menuState:State

func _ready():
	initialize_selector_frame()
	for i in range(0,5):
		var degrees = calculate_degrees(5)
		var angle = convert_degrees_to_radians(degrees*i)
		var iconPosition = calculate_icon_render_position(angle)
		instantiate_and_draw_icon(iconPosition)

func _process(_delta):
	match (menuState):
		State.ACTIVE:
			active_state()
		State.INACTIVE:
			inactive_state()

func active_state() -> void:
	if Input.is_action_just_pressed("ui_right"):
		rotate_icons_right()
	if Input.is_action_just_pressed("ui_left"):
		rotate_icons_left()

func inactive_state() -> void:
	if Input.is_action_just_pressed("menu_state_toggle"):
		menuState = State.ACTIVE

func calculate_degrees(numberOfIcons) -> int:
	var degreesToReturn = 360 / numberOfIcons
	return degreesToReturn

func convert_degrees_to_radians(degreesInput) -> float:
	return deg_to_rad(degreesInput)

func calculate_icon_render_position(radianInput) -> Vector2:
	var renderPosition = (Vector2(sin(radianInput), -cos(radianInput)).normalized()) * 100
	positions.push_back(renderPosition)
	return renderPosition

func instantiate_and_draw_icon(drawLocation) -> void:
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

func rotate_icons_left() -> void:
	var first_icon = icons.pop_front()
	icons.insert(icons.size(),first_icon)
	for n in range(0,icons.size()):
		var tween := get_tree().create_tween()
		tween.tween_property(icons[n],"position", positions[n], 0.1)

func initialize_selector_frame() -> void:
	var framePosition = (Vector2(0,-1).normalized() * 100)
	var newSelectorFrame = selectorFrame.instantiate()
	add_child(newSelectorFrame)
	newSelectorFrame.position = framePosition

func initialize_overlay():
	pass
