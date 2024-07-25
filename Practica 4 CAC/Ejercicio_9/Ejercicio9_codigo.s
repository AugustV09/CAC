.data
	X: .word 0
	Y: .word 7
	a: .word 5
	
.code
	ld $t0, X($0)
	ld $t2, a($0)
	ld $t1, Y($0)
	
loop:
	daddi $t2,$t2,-1
	bnez $t2,loop
	dadd $t0,$t0,$t1
	sd $t0, X($0)
	halt
