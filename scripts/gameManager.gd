extends Node


@export var currentPlayer := 1;

var player1:Node
var player2:Node

func _ready() -> void:
	player1 = get_parent().get_node("Player1")
	player2 = get_parent().get_node("Player2")
	if currentPlayer == 1:
		player1.playing = true
		player2.playing =false
	else:
		player2.playing = true
		player1.playing =false
		
