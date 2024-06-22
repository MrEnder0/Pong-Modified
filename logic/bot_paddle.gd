extends Area2D

const MOVE_SPEED = 100

var _ball_dir
var scene
var target_node
var dir

@onready var _screen_size_y = get_viewport_rect().size.y
@onready var _initial_pos = position
@onready var ball = $"../Ball"

func _ready():
	var n = String(name).to_lower()
	if n == "left":
		_ball_dir = 1
	else:
		_ball_dir = -1

func _process(delta):
	var moveUp = ball.position.y < position.y
	if moveUp:
		dir = -1
	else:
		dir = 1
		
	position.y = clamp(position.y + dir * MOVE_SPEED * delta, 16, _screen_size_y - 16)

func _on_area_entered(area):
	if area.name == "Ball":
		# Assign new direction.
		area.direction = Vector2(_ball_dir, randf() * 2 - 1).normalized()

func reset():
	position = _initial_pos
