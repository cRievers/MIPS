#Implemente um código em MIPS que efetue a leitura de um
#valor inteiro do terminal, e em seguida diga se ele é múltiplo
#11 ou de 4.

.data
	strEntrada: .asciiz "Type a number >> "
	str4: .asciiz "Is a multiple of 4.\n"
	str11: .asciiz "Is a multiple of 11.\n"
	strDif:.asciiz "Is not a multiple of 4 neither 11.\n"
	
.text
	#imprime string
	li $v0, 4
	la $a0, strEntrada
	syscall
	
	#ler int
	li $v0, 5
	syscall
	
	#move a entrada para um registrador
	move $t0, $v0
	
	# Verifica se é múltiplo de 11
	li $t8, 11
    	div $t0, $t8
    	mfhi $t1  # Resto da divisão por 11 em $t1
	beq $t1, $zero, multiplo11
	j verifica4
    	
nenhum: # Se chegou aqui, não é múltiplo de nenhum dos dois
    	li $v0, 4
    	la $a0, strDif
    	syscall
    	j exit
    	
verifica4: # Verifica se é múltiplo de 4
	li $t8, 4
  	div $t0, $t8
  	mfhi $t1  # Resto da divisão por 4 em $t1
    	beq $t1, $zero, multiplo4
    	j nenhum

multiplo11:
    	li $v0, 4
    	la $a0, str11
    	syscall
    	j verifica4

multiplo4:
    	li $v0, 4
    	la $a0, str4
    	syscall
    	j exit

exit:
    	li $v0, 10
    	syscall