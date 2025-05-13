extends Resource
class_name Jogada

var movimento: Vector2
var avaliacao: float
var peca: Node2D

func _init(movimento:Vector2, peca:Node2D, avaliacao: float) -> void:
	self.movimento = movimento
	self.peca = peca
	self.avaliacao = avaliacao
