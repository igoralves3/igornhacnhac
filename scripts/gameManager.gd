extends Node


@export var currentPlayer := 1;

var player1:Node2D
var player2:Node2D

func _ready() -> void:
	
	var gameNode = get_tree().root.get_node("Game")
	
	player1 =gameNode.get_node("Player1")
	player2 = gameNode.get_node("Player2")
	if currentPlayer == 1:
		player1.playing = true
		player2.playing =false
	else:
		player2.playing = true
		player1.playing =false
		
