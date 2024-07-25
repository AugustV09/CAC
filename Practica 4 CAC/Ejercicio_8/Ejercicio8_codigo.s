.data
	num: .word 6
	mult: .word 7
	RES: .word 0
	
.code
	ld $t0, num($0)
	ld $t1, mult($0)
	dadd $t2,$0,$0
	
loop:
	daddi $t1,$t1,-1
	bnez $t1,loop
	dadd $t2,$t2,$t0
	sd $t2, RES($0)
	halt
