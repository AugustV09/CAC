 .data 
	cant: .word 3
	A: .word 2
	B: .word 2
	C: .word 2
	D: .word 0 
 .code 
	ld $t1, cant($0)
	daddi $t6,$0,8
 	ld $t0, cant($t6)
	dadd $t5, $0,$0
	daddi $t1,$t1,-1
	daddi $t2,$0,8
	dadd $t7, $t1,$0
	daddi $t3,$t1,-1
loop:	
	ld $t4, A($t2)
	bne $t0,$t4, NO_SUMAR
	daddi $t2, $t2,8
	daddi $t5,$t5,1
	beq $t5,$t7,fin
NO_SUMAR:
	daddi $t1,$t1,-1
	bnez $t1, loop
	nop
	daddi $t1, $t3,0
	daddi $t2, $t2,-8
	daddi $t6,$t6,8
	ld $t0, cant($t6)
	bnez $t1, loop
	daddi $t3,$t3,-1
fin:
	sd $t5, D($0)
 	halt 