extends CanvasLayer

var gameManager: Node

@onready var label = $Label

func _ready() -> void:
	
	var gameNode = get_tree().root.get_node("Game")
	
	
	gameManager = gameNode.get_node("GameManager")
	
	set_text_color()
	
func _physics_process(delta: float) -> void:
	set_text_color()	

func set_text_color():
	if gameManager.currentPlayer == 1:
		
		label.set("theme_override_colors/font_color", Color.AQUA)
		
		label.text = "Player 1 Turn"
	else:
		label.set("theme_override_colors/font_color", Color.ORANGE)
		label.text = "Player 2 Turn"
