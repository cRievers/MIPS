# recebe a entrada de 10 valores do usuario e
# imprime em ordem inversa
.data
	vet: .space 40
	strPrompt: .asciiz "Valor >> "
	linha: .asciiz "\n"
	
.text
	#contador
	li $t0, 0
	#tamanho vetor
	li $t1, 10
	#endereço vetor
	la $t2, vet
	
for_leitura:
	li $v0, 4
	la $a0, strPrompt
	syscall #imprime msg
	
	li $v0, 5
	syscall #le int
	
	sw $v0, 0($t2) #armazena o valor no endereço do vetor 
	addi $t2, $t2, 4
	
	addi $t0, $t0, 1 #itera contador
	
	blt $t0, $t1, for_leitura
	#contador
	li $t0, 0
	
for_impressao:
	# aponta para a posição anterior
	sub $t2, $t2, 4
	
	li $v0, 1
	lw $a0, 0($t2)
	syscall #imprime int
	li $v0, 4
	la $a0, linha
	syscall #imprime nova linha
	
	# itera contador
	addi $t0, $t0, 1
	
	blt $t0, $t1, for_impressao