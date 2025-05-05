extends Node



@export var PlayerNumber = 1


@export var selectedPiece : Node2D = null

@export var playing:=false
@export var putting := false

func _ready():
	putting=false
	if PlayerNumber == 1:
		playing =true
		putting=false
	else:
		playing = false
		putting = false
		
		
func _physics_process(delta: float) -> void:
	pass
	
	

	
