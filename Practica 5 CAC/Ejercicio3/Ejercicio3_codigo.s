.data
	base: .double 5.85
	altura: .double 13.47

	RES: .double 0.0
.code
	l.d f1, base(r0)
	l.d f2, altura(r0)
	daddi $t0, $0,2
	mul.d f3, f1,f2
	mtc1 $t0, f4
	cvt.d.l f4,f4
	div.d f3, f3,f4
	halt
