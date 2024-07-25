.data   
DATA:       .word32 0x10008
CONTROL:    .word32 0x10000

.text   
    lwu     $a0,        DATA($0)
    lwu     $a1,        CONTROL($0)
    jal     ingreso
    dadd    $a2,        $0,             $v0
    jal     muestra
    halt    

ingreso:    
    daddi   $t0,        $0,             6
    daddi   $t1,        $0,             8
    sd      $t0,        0($a1)
    sd      $t1,        0($a1)
    ld      $v0,        0($a0)
    sd      $t0,        0($a1)
    sd      $t1,        0($a1)
    ld      $t2,        0($a0)
    dadd    $v0,        $v0,            $t2
    jr      $ra

muestra:    
    daddi   $t0,        $0,             6
    daddi   $t1,        $0,             2
    sd      $t0,        0($a1)
    sd      $v0,        0($a0)
    sd      $t1,        0($a1)
    jr      $ra                             # jump to $ra


