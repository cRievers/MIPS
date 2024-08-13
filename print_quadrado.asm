#imprimir um quadrado de asterisco com dimensões informadas pelo usuário

.data
	strPrompt: .asciiz "Informe as dimensoes do quadrado >> "
	ast: .asciiz "*"
	qlinha: .asciiz "\n"
.text
	# mostra a msg de entrada
	li $v0, 4
	la $a0, strPrompt
	syscall
	
	# leitura do tamanho do lado
	li $v0, 5
	syscall
	
	# move a entrada para $t0
	move $t0, $v0
	
	li $t1, 0
	
	beqz $t0, saida
	

linha:
	li $t2, 0
	li $v0, 4
	
	simbolos:
		#imprime um asterisco
		la $a0, ast
		syscall
		#incrementa
		addi $t2, $t2, 1
		#testa se deve continuar
		blt $t2, $t0, simbolos
	li $v0, 4
	la $a0, qlinha
	syscall
	
	addi $t1, $t1, 1
	
	blt $t1, $t0, linha
	
saida: