extends ColorRect


@export var row=1;
@export var column=1;

@export var pieceStack:= []

var gameManager: Node
var player1: Node
var player2: Node

func _ready():
	gameManager = get_parent().get_parent().get_node("GameManager")
	player1 = get_parent().get_parent().get_node("Player1")
	player2 = get_parent().get_parent().get_node("Player2")
	
func _physics_process(delta: float) -> void:
	pass
	
	
func onmouseclick() -> bool:
	var deltaX = abs(position.x-get_global_mouse_position().x)
	var deltaY = abs(position.y-get_global_mouse_position().y)
	return deltaX <= 50 and deltaY <= 50 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(&"player_action") and onmouseclick():
		if gameManager.currentPlayer == 1:
			if pieceStack.size() == 0:
				if player1.putting ==true:
					receivePiece(player1,player2)
					gameManager.currentPlayer=2
			else:
				var top = pieceStack[pieceStack.size()-1]
				if 	top.team == gameManager.currentPlayer and player1.selectedPiece.size > top.size:
					receivePiece(player1,player2)
					gameManager.currentPlayer=2
					
			
		if gameManager.currentPlayer == 2:
			if pieceStack.size() == 0:
				if player2.putting == true:
					receivePiece(player2,player1)
					gameManager.currentPlayer=1
			else:
				var top = pieceStack[pieceStack.size()-1]
				if 	top.team == gameManager.currentPlayer and player2.selectedPiece.size > top.size:
					receivePiece(player2,player1)
					gameManager.currentPlayer=2
			
	
			
		
	
func receivePiece(player, otherPlayer):
	var top = player.selectedPiece
	
	top.currentCellRow = row
	top.currentCellColumn = column
	
	pieceStack.append(player.selectedPiece)
	player.selectedPiece.position = position
	player.selectedPiece = null
	player.putting = false
	player.playing = false
	otherPlayer.playing = true
	otherPlayer.putting=false
	
	print(str(row) + " x " + str(column))
	
	var cells = get_parent().get_parent().get_node("Cells").get_children()
	for c in cells:
		var ps = c.pieceStack
		if ps.size() > 0:
			if ps[ps.size()-1].team == top.team and ps[ps.size()-1].size == top.size:
				c.pieceStack.pop_at(ps.size()-1);
	
#func transferPiece(Node piece, Node cell, int player):
	
	
