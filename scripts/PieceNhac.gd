extends Sprite2D


@export var team: int = 1;
@export var size: int = 1;
@export var defaultPosition = position;

@export var currentCellRow = -1;
@export var currentCellColumn = -1;

var gameManager: Node
var player1: Node
var player2: Node

var cells

func _ready():
	defaultPosition = position
	gameManager = get_parent().get_parent().get_node("GameManager")
	player1 = get_parent().get_parent().get_node("Player1")
	player2 = get_parent().get_parent().get_node("Player2")
	cells = get_parent().get_parent().get_node("Cells").get_children()
		
func _physics_process(delta: float) -> void:
	pass
	
func onmouseclick() -> bool:
	var deltaX = abs(position.x-get_global_mouse_position().x)
	var deltaY = abs(position.y-get_global_mouse_position().y)
	return deltaX <= 50 and deltaY <= 50 
		
	
func _input(event: InputEvent) -> void:

	if event.is_action_pressed(&"player_action") and onmouseclick():
		print("team " + str(team) + " size " + str(size))
		if gameManager.currentPlayer == 1:
			if team == gameManager.currentPlayer:
				print(str(gameManager.currentPlayer))
				if player1.putting == false:
					print('selecting');
					player1.putting = true
					player1.selectedPiece = self
				
					
					
			else:
				print('putting');
		else:
			if team == gameManager.currentPlayer:
				print(str(gameManager.currentPlayer))
				if player2.putting == false:
					print('selecting');
					player2.putting = true
					player2.selectedPiece = self
				#else:
						
				
		
		
