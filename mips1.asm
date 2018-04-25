## minmax.a - imprime los valores maximos y minimos de un arreglo de 
## enteros.
##
## Asume que el arreglo tiene al menos dos elementos (a[0],a[1]).
## Se inicializa como minimo y maximo a[0]
## despues con ayuda de instrucciones de bifurcacion hace un recorrido 
## que recorre el arreglo.  
##
##  t0 - apunta a los elementos del arreglo
##  t1 - contiene la cuanta de elementos
##  t2 - contiene min
##  t3 - contiene max
##  t4 - para cada palabra del arreglo en cada iteracion
##

#################################################
#                  text segment                 #
#################################################
	.data    	# Aqui empieza el segmento de datos
array:	.word 3,4,1,6,12,7,18,26,2,14,19,7,8,29,13
count:	.word 15
endl:	.asciiz "\n"
ans1:	.asciiz "min = "
ans2:	.asciiz "\nmax = "
   .text              # Aqui empieza el segmento de codigo
   .globl __start
__start:

   la $t0,array       # $t0 apuntara a los elementos
   lw $t1,count       # sale del bucle cuando $t1 es 0
   lw $t2,($t0)       # inicializa min ($t2) 
   lw $t3,($t0)       # y max ($t3) con a[0]
   add $t0,$t0,4      # el apuntador empieza en a[1]
   add $t1,$t1,-1     # y va dando vueltas count-1 veces
loop:
   lw $t4,($t0)       # carga la siguiente palabra del arreglo
   bge $t4,$t2,notMin # salta si a[i] >= min
   move $t2,$t4      # copia a[i] en min
notMin:
   ble $t4,$t3,notMax # salta si a[i] <= max
   move $t3,$t4       # copia a[i] en max
notMax:
   add $t1,$t1,-1     # decrementa el contador
   add $t0,$t0,4      # incrementa el puntero una palabra
   bnez $t1,loop      # y continua si contador>0

   la $a0,ans1        # cuando termina el bucle imprime respuestas
   li $v0,4
   syscall            # imprime "min = "

   move $a0,$t2
   li $v0,1
   syscall            # imprime el valor de min

   la $a0,ans2
   li $v0,4
   syscall            # imprime "\nmax = "

   move $a0,$t3
   li $v0,1
   syscall            # imprime el valor de max

   la $a0,endl        # imprime un salto de linea
	li $v0,4	 
	syscall

	li $v0,10
	syscall      # fin del programa...

#################################################
#                  data segment                 #
#################################################


##
## fin de archivo