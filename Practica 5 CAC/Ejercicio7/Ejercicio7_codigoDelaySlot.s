	.data 
M:	.word 34 
tabla:	.word 4,45,23,12,65,22 
long:	.word 6
result:	.word 0 
  
 	.text 
 	ld    $a0, M($0) 
 	daddi $a1, $0, tabla
	ld    $a2, long($0) 
 	jal   mayores_que_m 
 	sd    $v0, result($0) ; se hace 2 veces esta instruccion: una por el Delay Slot y la otra por el jr que devuelve el control a esta linea
 	halt 
 
mayores_que_m: 
	daddi $t2,$0,0
	daddi $v0, $0, 0
lazo:
	ld $t1, 0($a1) 
	daddi $a2, $a2,-1  ; esta linea esta aca para que no haya RAWs entre el LOAD previo y el SLT
 	slt   $t2, $a0, $t1
	dadd $v0, $v0, $t2
	daddi $a1,$a1,8 
 	bnez  $a2, lazo 
	daddi $t2,$0,0
	jr    $ra 