		.data 
cadena1:	.asciiz "bueno" 
cadena2:	.asciiz "bueno"
result: 	.word 0

  
 		.text 
 		daddi $a0, $0, cadena1
		daddi $a1, $0, cadena2 
 		jal   cadenas_iguales 
 		sd    $v0, result($0) 
 		halt 
 
cadenas_iguales:
		daddi $t2, $0,-1
		daddi $v0, $0, -1
lazo:
		lbu $t0, 0($a0)
		lbu $t1, 0($a1)
		daddi $a0, $a0,1
		dadd $t3, $t0,$t1
		daddi $a1, $a1,1
		beqz $t3, terminar
		daddi $t2, $t2,1
 		beq $t0,$t1, lazo
		dadd $v0, $0, $t2
terminar:
		jr    $ra 