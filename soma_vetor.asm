#somar todos os valores do array

.data
	vet: .byte 7, 3, 5, 10, 12

.text
	la $t0, vet # primeiro endereço do array
	#ultimo endereço do array
	addi $t1, $t0, 5
	
	li $t3, 0
	
imprime:
	li $v0, 1
	lb $a0, ($t0) #entre parenteses significa endereço
	syscall
	
	add $t3, $t3, $a0
	sb $t3, ($t0)
	
	addi $t0, $t0, 1
	blt $t0, $t1, imprime