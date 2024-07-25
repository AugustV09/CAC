.data
	A: .word 1
	B: .word 6
	C: .word 0
.code
	ld r2, B(r0)
	ld r1, A(r0)
	dadd r4, r0,r0
loop:
	daddi r2, r2, -1
	sd r1, C(r4)
  dsll r1, r1, 1
  daddi r4,r4,8
	bnez r2, loop
	sd r1, C(r4)
	halt
