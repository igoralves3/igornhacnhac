extends Node
class_name Tabuleiro

var pecasP1 = []
var pecasP2 = []

@export var tabuleiro: Array = []
@export var jogador:int

func _init() -> void:
	self.tabuleiro = [
		[ [], [], [] ],
		[ [], [], [] ],
		[ [],[],[] ]
	]
	self.jogador = 1
	
func alternar_jogador() -> void:
	self.jogador = 1 if self.jogador == 2 else 1
	
func empate():
	for linha in self.tabuleiro:
		for coluna in linha:
			if coluna.size() == 0:
				return false
	return true
	
	
func avaliar() -> float:
	var avaliacao = 0.0
	
	for i in range(3):
		
		var linhaicol0 = self.tabuleiro[i][0]
		var linhaicol1 = self.tabuleiro[i][1]
		var linhaicol2 = self.tabuleiro[i][2]
		
		if linhaicol0.size() > 0 and linhaicol1.size() > 0 and linhaicol2.size() > 0:
			var currentTeam = linhaicol0[linhaicol0.size()-1].team
			if currentTeam == linhaicol1[linhaicol1.size()-1].team and currentTeam == linhaicol2[linhaicol2.size()-1].team:
				avaliacao = 1 if currentTeam == jogador else -1
				
		var linha0coli = self.tabuleiro[0][i]
		var linha1coli = self.tabuleiro[1][i]
		var linha2coli = self.tabuleiro[2][i]
		
		if linha0coli.size() > 0 and linha1coli.size() > 0 and linha2coli.size() > 0:
			var currentTeam = linha0coli[linha0coli.size()-1].team
			if currentTeam == linha1coli[linha1coli.size()-1].team and currentTeam == linha2coli[linha2coli.size()-1].team:
				avaliacao = 1 if currentTeam == jogador else -1
				
	
	var linha0col0=self.tabuleiro[0][0]
	var linha1col1=self.tabuleiro[1][1]
	var linha2col2=self.tabuleiro[2][2]
	var linha0col2=self.tabuleiro[0][2]
	var linha2col0=self.tabuleiro[2][0]
	
	if linha0col0.size() > 0 and linha1col1.size() > 0 and linha2col2.size() > 0:
		var currentTeam = linha0col0[linha0col0.size()-1].team
		if currentTeam == linha1col1[linha1col1.size()-1].team and currentTeam == linha2col2[linha2col2.size()-1].team:
			avaliacao = 1 if currentTeam == jogador else -1
	
	if linha2col0.size() > 0 and linha1col1.size() > 0 and linha0col2.size() > 0:
		var currentTeam = linha2col0[linha2col0.size()-1].team
		if currentTeam == linha1col1[linha1col1.size()-1].team and currentTeam == linha0col2[linha0col2.size()-1].team:
			avaliacao = 1 if currentTeam == jogador else -1
	
	return avaliacao
	
func jogador_atual() -> int:
	return jogador
	
func jogadas_possiveis(peca: Node2D) -> Array:
	var jogadasPossiveis: Array = []
	for linha in range(3):
		for coluna in range(3):
			var atual = tabuleiro[linha][coluna]
			if atual.size() > 0:
				var top = atual[atual.size()-1]
				if  peca.size > top.size:
					jogadasPossiveis.append(Vector3(linha,coluna,peca.size))
					
			else:
				jogadasPossiveis.append(Vector3(linha,coluna,peca.size))
	return jogadasPossiveis
	
func movimentar(movimento: Vector2, peca: Node2D, jogador: int) -> Tabuleiro:
	var linha = movimento.x
	var coluna = movimento.y
	
	var novoTabuleiro = self.duplicate(true)
	
	if novoTabuleiro.tabuleiro[linha][coluna].size() > 0:
		var cell = novoTabuleiro.tabuleiro[linha][coluna]
		var top = cell[cell.size()-1]
		if top.size < peca.size:
			novoTabuleiro.tabuleiro[linha][coluna].append(peca)
			
	return novoTabuleiro
	
func valida_jogada(casa: Vector2, peca: Node2D):
	if tabuleiro[casa.x][casa.y].size() > 0:
		var cell = tabuleiro[casa.x][casa.y]
		var top = cell[cell.size()-1]
		if top.size < peca.size():
			return true
		return false
	return true
	

func jogada(casa: Vector2,peca:Node2D)->bool:
	if valida_jogada(casa,peca):
		tabuleiro[casa.x][casa.y].append(peca)
		alternar_jogador()
		return true
	return false
