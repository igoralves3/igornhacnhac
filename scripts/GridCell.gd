extends ColorRect





@export var row=1;
@export var column=1;

@export var pieceStack := Array([], TYPE_OBJECT, "Node2D", null)



@export var topSprite:Node2D = null

var gameManager: Node
var player1: Node2D
var player2: Node2D
var currentPlayer: Node2D

func _ready():
	gameManager = get_parent().get_parent().get_node("GameManager")
	player1 = get_parent().get_parent().get_node("Player1")
	player2 = get_parent().get_parent().get_node("Player2")
	currentPlayer = player1
	
func _physics_process(delta: float) -> void:
	pass
	
	
func onmouseclick() -> bool:
	var deltaX = abs(position.x-get_global_mouse_position().x)
	var deltaY = abs(position.y-get_global_mouse_position().y)
	return deltaX <= 50 and deltaY <= 50 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"player_action"):
		if onmouseclick():
			print(pieceStack);
			
			if gameManager.currentPlayer == 1:
				
				if player1.putting ==true:
					
					if pieceStack.size() == 0:
						
						receivePiece(player1,player2)
						gameManager.currentPlayer=2
					else:
						var top = pieceStack[pieceStack.size()-1]
						if top.size < player1.selectedPiece.size:
							receivePiece(player1,player2)
							gameManager.currentPlayer=2
				else:
					if pieceStack.size() > 0:
						var top = pieceStack[pieceStack.size()-1]
						if top.team == 1:
							player1.selectedPiece = top
							player1.selectedPiece.dragged=true
						
							pieceStack.pop_back()
						
				
					
				
						
			if gameManager.currentPlayer == 2:
				
				if player2.putting == true:
					if pieceStack.size() == 0:
						receivePiece(player2,player1)
						gameManager.currentPlayer=1
				
				
				
			
		
	
func receivePiece(player, otherPlayer):

	var top = player.selectedPiece
	print(player.selectedPiece)
	pieceStack.append(player.selectedPiece)
	
	
	
	player.selectedPiece.dragged = false
	
	top.currentCellRow = row
	top.currentCellColumn = column
	
	
	player.selectedPiece.position = position
	player.selectedPiece = null
	player.putting = false
	player.playing = false
	otherPlayer.playing = true
	otherPlayer.putting=false
	if gameManager.currentPlayer == 1:
		gameManager.currentPlayer = 2
		
	else:
		gameManager.currentPlayer = 1
		
	#print(str(row) + " x " + str(column))
	
	
	

	
	
