extends CharacterBody2D

@onready var sprite = preload("res://GUI Icons/icon_sprite.tscn")
var degrees = null
var angle = null
var spriteLocation = null
var degreesAroundSprite = 360
var icons = [0, 1, 2, 3, 4]


func _ready():
	degrees = calculate_degrees(icons.size())
	angle = convert_degrees_to_radians(degrees)
	var iconPosition = calculate_icon_render_position(angle)
	print(iconPosition)
	var newSprite = sprite.instantiate()
	add_child(newSprite)
	newSprite.position = iconPosition
	var newDirection = iconPosition.rotated(angle)
	print(newDirection)
	var newNewSprite = sprite.instantiate()
	add_child(newNewSprite)
	newNewSprite.position = newDirection

func calculate_degrees(numberOfIcons):
	var degreesToReturn = degreesAroundSprite / numberOfIcons
	return degreesToReturn

func convert_degrees_to_radians(degreesInput):
	return deg_to_rad(degreesInput)

func calculate_icon_render_position(radianInput):
	return (Vector2(cos(radianInput), sin(radianInput)).normalized()) * 100
