.data
array: .word 5, -2, 18, -1, -30

.text
.globl main

main:

    la $t0, array      
    li $t1, 5      
    li $t3, 0         
    li $s0, 0        

loop:

    beq $t3, $t1, done    

    lw $t4, 0($t0)         

    slt $t5, $t4, $zero  

    add $s0, $s0, $t5      

    addi $t0, $t0, 4      
    addi $t3, $t3, 1      

    j loop                

done:

    li $v0, 10
    syscall

