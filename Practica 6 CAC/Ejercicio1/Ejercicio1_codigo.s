.data   
texto:      .asciiz 0                           ; El mensaje a mostrar
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
.text   
    lwu     $s0,        DATA(r0)                ; $s0 = dirección de DATA
    lwu     $s1,        CONTROL(r0)             ; $s1 = dirección de CONTROL
    daddi   $t1,        $0,             texto   ; $t0 = dirección del mensaje a mostrar

ingresar:   
    daddi   $t0,        $0,             9
    sd      $t0,        0($s1)
    ld      $t2,        0($s0)                  ; funciona bien asi sin NOPs antes del ld??(porque podria pasar que se lea de memoria antes de escribir en data)
    dadd    $t3,        $0,             $t2     ; copio $t2 a $t3
    daddi   $t3,        $t3,            -0x30   ; resto '0' a $t3 para evaluar cuando me ingresen el cero
    beqz    $t3,        terminar                ; evaluo si el caracter ingresado es NULL (0)
    sb      $t2,        0($t1)
    daddi   $t1,        $t1,            1
    j       ingresar

terminar:   
    sb      $t3,        0($t1)                  ; esta linea es para que se almacene 0 (NULL) al final del string y la salida sea correcta
    daddi   $t1,        $0,             texto   ; $t0 = dirección del mensaje a mostrar
    sd      $t1,        0($s0)                  ; DATA recibe el puntero al comienzo del mensaje
    daddi   $t2,        $0,             4
    sd      $t2,        0($s1)

    halt    
