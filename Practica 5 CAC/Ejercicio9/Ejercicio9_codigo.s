		.data 
valor:		.word 10 
result: 	.word 0

  
 		.text 
 		daddi $sp, $0, 0x400
		ld $a0, valor($0) 
 		jal   factorial
 		sd    $v0, result($0) 
 		halt 
 
factorial:
		daddi $sp,$sp,-8
		sd $ra, 0($sp)
		daddi $a0,$a0,-1
		beqz $a0, terminar2
		jal factorial
		daddi $a0,$a0,1
		dmul $v0, $v0, $a0
		j terminar
terminar2:
		daddi $v0,$0,1
		daddi $a0,$a0,1  ; es necesaria esta suma porque sino $a0 se queda un valor por detras y no se completa el factorial
		
terminar:
		ld $ra, 0($sp)
		daddi $sp, $sp, 8
		jr    $ra 
