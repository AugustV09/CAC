.data   
NUM: .byte 1,2
CERO:       .ascii  "CERO", 0, 0, 0
UNO:        .ascii  "UNO", 0, 0, 0, 0
DOS:        .ascii  "DOS", 0, 0, 0, 0
TRES:       .ascii  "TRES", 0, 0, 0
CUATRO:     .ascii  "CUATRO", 0
CINCO:      .ascii  "CINCO", 0, 0
SEIS:       .ascii  "SEIS", 0, 0, 0
SIETE:      .ascii  "SIETE", 0, 0
OCHO:       .ascii  "OCHO", 0, 0, 0
NUEVE:      .ascii  "NUEVE", 0, 0

LONG:       .word   8
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.text   
    lwu     $a0,            DATA($0)                    # $a0 = dirección de DATA
    lwu     $a1,            CONTROL($0)                 # $a1 = dirección de CONTROL
    jal     ingreso
    ld      $a0,            LONG($0)
    dadd    $a2,            $0,             $v0         #$a2 contiene el numero
    daddi   $a3,            $0,             CERO        #$a3 contiene la direccio de memoria de "CERO"
    jal     muestra
    halt    


ingreso:    
    daddi   $t0,            $0,             6
    daddi   $t1,            $0,             8
    daddi   $t3,            $0,             -10
bucle_ingreso:
    sd      $t0,            0($a1)
    sd      $t1,            0($a1)
    ld      $v0,            0($a0)                      # funciona bien asi sin NOPs antes del ld??(porque podria pasar que se lea de memoria antes de escribir en data)
    slti    $t2,            $v0,            10          # $t2 = ($s0 < 0) ? 1 : 0
    beqz    $t2,            bucle_ingreso
    slt     $t4,            $t3,            $v0         # $t2 = ($s0 < $s1) ? 1 : 0
    beqz    $t4,            bucle_ingreso
    jr      $ra

muestra:    
    daddi   $t1,            $0,             0
bucle_muestra:
    beq     $a2,            $t1,            terminar    # if $a2 == $t1 then goto target
    dadd    $a3,            $a3,            $a0
    daddi   $t1,            $t1,            1
    j       bucle_muestra

terminar:   
    sd      $a3,            8($a1)                      #guardo la direccion de la cadena respctiva en DATA
    daddi   $t0,            $0,             4
    sd      $t0,            0($a1)                      #Guardo el comando correspondiente en CONTROL
    jr      $ra

