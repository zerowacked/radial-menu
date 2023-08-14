extends CharacterBody2D

@onready var sprite = preload("res://GUI Icons/icon_sprite.tscn")
var degrees = null
var angle = null
var spriteLocation = null
var degreesAroundSprite = 360
var icons = [0, 1, 2, 3, 4]


func _ready():
	var numberOfIcons = icons.size()
	for i in range(0,icons.size()):
		degrees = calculate_degrees(numberOfIcons)
		angle = convert_degrees_to_radians(degrees*i)
		var iconPosition = calculate_icon_render_position(angle)
		instantiate_and_draw_icon(sprite,iconPosition)
		#degrees = add_equidistant_degrees(degrees)
		#angle = convert_degrees_to_radians(degrees)
		#iconPosition = calculate_icon_render_position(angle)
		#instantiate_and_draw_icon(sprite,iconPosition)
	#print(newDirection)
	#var newNewSprite = sprite.instantiate()
	#add_child(newNewSprite)
	#newNewSprite.position = newDirection

func calculate_degrees(numberOfIcons):
	var degreesToReturn = degreesAroundSprite / numberOfIcons
	return degreesToReturn

func convert_degrees_to_radians(degreesInput):
	return deg_to_rad(degreesInput)

func calculate_icon_render_position(radianInput):
	return (Vector2(sin(radianInput), -cos(radianInput)).normalized()) * 100

func instantiate_and_draw_icon(iconInput,drawLocation):
	var newIcon = iconInput.instantiate()
	add_child(newIcon)
	newIcon.position = drawLocation

func add_equidistant_degrees(degreesInput):
	degreesInput += degreesInput
	return degreesInput

func populate_icon():
	pass
