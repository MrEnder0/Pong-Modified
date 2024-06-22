extends Area2D

@onready var ball = $"../Ball"
@onready var left_score = $"../LeftScore"
@onready var right_score = $"../RightScore"

var score = 0

func _ready():
	await get_tree().create_timer(0.1).timeout
	score = 0
	left_score.text = "0"
	right_score.text = "0"
	
	
func _on_wall_area_entered(area):
	if ball.position.x < 10:
		if self.position.x < 10:
			score += 1
			var label_text = "%s"
			right_score.text = label_text % score
	else:
		if self.position.x > 640:
			score += 1
			var label_text = "%s"
			left_score.text = label_text % score
		
	if area.name == "Ball":
		area.reset()
