extends Node2D


@export var team: int = 1;
@export var size: int = 1;
@export var defaultPosition = position;

@export var currentCellRow = -1;
@export var currentCellColumn = -1;

var gameManager: Node
var player1: Node
var player2: Node

var cells



@export var dragged = false

func _ready():
	var gameNode = get_tree().root.get_node("Game")
	
	defaultPosition = position
	gameManager = gameNode.get_node("GameManager")
	player1 = gameNode.get_node("Player1")
	player2 = gameNode.get_node("Player2")
	cells = gameNode.get_node("Cells").get_children()
		
func _physics_process(delta: float) -> void:
	if dragged:
		position = get_global_mouse_position()
	elif currentCellRow == -1 and currentCellColumn == -1:
		position = defaultPosition
	
func onmouseclick() -> bool:
	var deltaX = abs(position.x-get_global_mouse_position().x)
	var deltaY = abs(position.y-get_global_mouse_position().y)
	return deltaX <= 50 and deltaY <= 50 
		
	
func _input(event: InputEvent) -> void:

	if event.is_action_pressed(&"player_action"):
		if onmouseclick():
			#print("team " + str(team) + " size " + str(size))
			if !dragged:
				if gameManager.currentPlayer == 1:
					if team == gameManager.currentPlayer:
						print(str(gameManager.currentPlayer))
						if player1.putting == false:
							#print('selecting');
							player1.putting = true
							
							player1.selectedPiece =self
				
							dragged = true
								
				else:
					if team == gameManager.currentPlayer:
						print(str(gameManager.currentPlayer))
						if player2.putting == false:
							#print('selecting');
							player2.putting = true
							player2.selectedPiece = self
					
							dragged = true
						#else:
								
				
		
		
