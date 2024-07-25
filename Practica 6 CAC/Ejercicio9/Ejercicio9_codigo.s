.data   
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
color:      .byte   255, 0, 0, 0
A:          .ascii  "a"
W:          .ascii  "w"
S:          .ascii  "s"
D:          .ascii  "d"
espacio:    .ascii  " "

.text   
    lwu     $s0,    CONTROL($0)
    lwu     $s1,    DATA($0)
    lbu     $s2,    A($0)
    lbu     $s3,    W($0)
    lbu     $s4,    S($0)
    lbu     $s5,    D($0)
    lbu     $s6,    espacio($0)
    lwu     $s7,    color($0)
    daddi   $t0,    $0,             7
    daddi   $t1,    $0,             5
    sd      $t0,    0($s0)
    daddi   $v0,    $0,             25      ; Coordenada X
    daddi   $v1,    $0,             25      ; Coordenada Y
    daddi   $t2,    $0,             9
    sw      $s7,    0($s1)
    sb      $v0,    5($s1)
    sb      $v1,    4($s1)
    sd      $t1,    0($s0)
loop:       
    sd      $t2,    0($s0)
    lbu     $t3,    0($s1)
    bne     $t3,    $s3,            w_way
    daddi   $v1,    $v1,            1
    j       seguir
w_way:      

s_way:      

d_way:      

espacio_way:

seguir:     

    sw      $s7,    0($s1)
    sb      $v0,    5($s1)
    sb      $v1,    4($s1)
    sd      $t1,    0($s0)
    j       loop
    halt    