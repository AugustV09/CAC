.data   
DATA:       .word32 0x10008
CONTROL:    .word32 0x10000
NUM:        .double 1


.text   
    lwu     $s0,            DATA($0)
    lwu     $s1,            CONTROL($0)
    daddi   $t0,            $0,             8
    daddi   $t1,            $0,             6
    daddi   $t3,            $0,             3
    sd      $t0,            0($s1)
    l.d     f0,             0($s0)              ; f0 = base
    sd      $t1,            0($s1)
    sd      $t0,            0($s1)
    ld      $a1,            0($s0)              ; $a1 = exponente
    sd      $t1,            0($s1)
    jal     a_la_potencia
    s.d     f1,             0($s0)
    sd      $t3,            0($s1)
    halt    

a_la_potencia:
    l.d     f1,             NUM($0)
    beqz    $a1,            fin

multiplicar:
    daddi   $a1,            $a1,            -1
    mul.d   f1,             f1,             f0
    bnez    $a1,            multiplicar

fin:        
    jr      $ra

