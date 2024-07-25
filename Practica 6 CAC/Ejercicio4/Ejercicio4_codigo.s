.data   
DATA:       .word32 0x10008
CONTROL:    .word32 0x10000
LONG:       .word   8
BIENVENIDO: .asciiz "Bienvenido"
ERROR:      .asciiz "ERROR"
clave:      .asciiz "hola"
nueva:      .asciiz "0"


.text   
    lwu     $a0,            DATA($0)
comenzar:   
    lwu     $a1,            CONTROL($0)
    daddi   $a2,            $0,                 nueva
    daddi   $t9,            $0,                 4
bucle:      
    jal     char
    daddi   $t9,            $t9,                -1
    daddi   $a2,            $a2,                8               ;tuve que poner 8 en vez de 1 porque el MIPS no me funcionaba
    bnez    $t9,            bucle

    ld      $a2,            LONG($0)
    daddi   $a3,            $0,                 clave
    daddi   $a1,            $0,                 4
    jal     respuesta
    beqz    $v0,            comenzar
    halt    

char:       
    daddi   $t0,            $0,                 6
    daddi   $t1,            $0,                 9
    sd      $t0,            0($a1)
    sd      $t1,            0($a1)
    ld      $t2,            0($a0)
    sd      $t2,            0($a2)
    jr      $ra

respuesta:  
    dadd    $t2,            $a3,                $a2             #$t2 tiene la direccion de clave nueva
    dadd    $t3,            $0,                 $a3
bucle_respu:
    lbu     $t0,            0($t3)                              #Cargo la clave vieja en $t0
    lbu     $t1,            0($t2)                              #Cargo la clave nueva en $t1
    beqz    $t0,            iguales_respuesta

    daddi   $t2,            $t2,                8
    daddi   $t3,            $t3,                1
    beq     $t1,            $t0,                bucle_respuesta

    dsub    $a3,            $a3,                $a2
    daddi   $t4,            $0,                 6
    daddi   $t5,            $0,                 4
    sd      $a3,            0($a0)
    sd      $t4,            -8($a0)
    sd      $t5,            -8($a0)
    daddi   $v0,            $0,                 0
    j       fin_respuesta

iguales_respuesta:
    dadd    $a2,            $a2,                $a2
    dsub    $a3,            $a3,                $a2
    daddi   $t4,            $0,                 6
    daddi   $t5,            $0,                 4
    sd      $a3,            0($a0)
    sd      $t4,            -8($a0)
    sd      $t5,            -8($a0)
    daddi   $v0,            $0,                 1

fin_respuesta:
    jr      $ra