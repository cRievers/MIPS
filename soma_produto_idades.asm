# 1 – Escreva um algoritmo que leia as idades de 2 homens e de 2 mulheres
# (considere que as idades dos homens serão sempre diferentes entre si,
# bem como as das mulheres). Calcule e escreva a soma das idades
# do homem mais velho com a mulher mais nova, e o produto das idades
# do homem mais novo com a mulher mais velha

.data
	vetIdade: .space 16 # reserva 4 int na memória
	strIdade: .asciiz "Informe a idade >> "
	strEntrada: .asciiz "Ordem de entrada:\n1- Homem\n2- Homem\n3- Mulher\n4- Mulher\n"
	
.text
	la $t0, vetIdade # primeiro endereço do vetor de idade
	li $t1, 0 # contador
	li $t2, 4 # quantidade de idades
	li $v0, 4
	la $a0, strEntrada
	syscall # imprime formato das entradas
	
leitura:
	li $v0, 4
	la $a0, strIdade
	syscall # imprime msg de leitura
	li $v0, 5
	syscall # leitura da idade
	sw $v0, 0($t0) # armazena em uma posicao do vetor
	addi $t0, $t0, 4 # aponta para a próx posição do vet
	addi $t1, $t1, 1 # itera contador
	blt $t1, $t2, leitura

calculo:
	#passa o vetor para os registradores 
	lw $t4, 0($t0)
	lw $t4, 4($t0)
	jal ordena
	
ordena:
	
	
	
	