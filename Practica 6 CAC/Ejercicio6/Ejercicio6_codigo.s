.data   
X:          .asciiz "Ingrese la coordenada X: "
Y:          .asciiz "Ingrese la coordenada Y: "
color:      .byte   255, 0, 255, 0              # color: máximo rojo + máximo azul => magenta
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008

.text   
lwu     $s6,    CONTROL(r0)                     # $s6 = dirección de CONTROL
lwu     $s7,    DATA(r0)                        # $s7 = dirección de DATA

daddi   $t0,    $0,             7               # $t0 = 7 -> función 7: limpiar pantalla gráfica
sd      $t0,    0($s6)                          # CONTROL recibe 7 y limpia la pantalla gráfica

daddi   $t1,    $0,             4
daddi   $t3,    $0,             X
daddi   $t2,    $0,             8
daddi   $t4,    $0,             Y

sd      $t3,    0($s7)                          # cargo la direccion de la cadena X en DATA
sd      $t1,    0($s6)                          # imprimo la cadena X
sd      $t2,    0($s6)                          # leo un numero entero
daddi   $t5,    $0,             6
ld      $s0,    0($s7)                          # Cargo la coordenada X en $s0
sd      $t5,    0($s6)                          # limpio la pantalla de texto
sd      $t4,    0($s7)                          # cargo la direccion de la cadena Y en DATA
sd      $t1,    0($s6)                          #imprimo la cadena Y
sd      $t2,    0($s6)
ld      $s1,    0($s7)                          # Cargo la coordenada Y en $s1
sd      $t5,    0($s6)                          # limpio la pantalla de texto nuevamente para que no se vea reflejado en la terminal grafica

sb      $s0,    5($s7)                          # DATA+5 recibe el valor de coordenada X
sb      $s1,    4($s7)                          # DATA+4 recibe el valor de coordenada Y
lwu     $s2,    color(r0)                       # $s2 = valor de color a pintar
sw      $s2,    0($s7)                          # DATA recibe el valor del color a pintar


daddi   $t0,    $0,             5               # $t0 = 5 -> función 5: salida gráfica
sd      $t0,    0($s6)                          # CONTROL recibe 5 y produce el dibujo del punto
halt    