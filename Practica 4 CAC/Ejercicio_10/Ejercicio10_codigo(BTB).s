.data
	cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
	car: 		.asciiz "d" 							 ; caracter buscado
	cant: 	.word 0 									 ; cantidad de veces que se repite el caracter car en cadena.
	
.code
	lbu $t0, car($0)
	ld $t2, cant($0)
	dadd $t1, $0,$0
	
loop:
	lbu $t3, cadena($t1)
	daddi $t1,$t1,1
	beqz $t3,fin
	bne $t3,$t0, loop
	daddi $t2,$t2,1
	j loop
	
fin:
	sd $t2, cant($0)
	halt
