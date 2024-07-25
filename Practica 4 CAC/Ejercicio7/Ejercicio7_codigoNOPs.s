.data
	LONG: .word 10 
	tabla: .word 1,2,3,4,5,6,7,8,9,10
	X: .word 4
	CANT: .word 0
	RES: .word 0

.code
	ld $t0, X($0)
	dadd $t1, $0, $0
	ld $t2, LONG($0)
	dadd $t4, $0, $0
	dadd $s0, $0, $0
loop:
	ld $t3, tabla($t1)
	nop
	slt $t4, $t0, $t3
	nop
	sd $t4, RES($t1)
	nop
	beqz $t4, NO_SUMAR
	nop
	daddi $s0, $s0,1

NO_SUMAR:
	daddi $t1,$t1,8
	bnez $t2, loop
	daddi $t2, $t2,-1
	sd $s0, CANT($0)
	halt
