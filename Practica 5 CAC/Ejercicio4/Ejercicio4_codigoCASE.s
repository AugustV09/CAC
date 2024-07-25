.data
	estatura: .double 1.73
	peso: .double 75.7
	IMCS: .double 18.5, 25,30
	IMC: .word 0
.code
	l.d f1, estatura($0)
	l.d f2, peso($0)
	mul.d f1, f1,f1
	daddi $t0, $0,0
	l.d f4, IMCS($t0)
	daddi $t0,$t0,8
	l.d f5, IMCS($t0)
	daddi $t0, $t0,8
	l.d f6, IMCS($t0)
	div.d f3,f2,f1
	daddi $t1, $0,1
	daddi $t2, $0,2
	daddi $t3,$0,3
	daddi $t4,$0,4
	c.lt.d f3,f4
	bc1f case2
	sd $t1, IMC($0)
	j fin
case2:
	c.lt.d f3,f5
	bc1f case3
	sd $t2, IMC($0)
	j fin
case3:
	c.lt.d f3,f6
	bc1f case4
	sd $t3, IMC($0)
	j fin
case4:
	sd $t4, IMC($0)
fin:
	halt
