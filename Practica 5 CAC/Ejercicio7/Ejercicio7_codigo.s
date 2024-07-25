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
 	sd    $v0, result($0) 
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
	daddi $t2,$0,0 
 	bnez  $a2, lazo 
	jr    $ra 