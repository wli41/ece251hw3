.data
prompt1:     .asciiz "Enter first integer: "
prompt2:     .asciiz "Enter second integer: "
result_msg:  .asciiz "Final value: "
newline:     .asciiz "\n"

final_val:   .word 0

.text
.globl main

main:

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0        

   
    sll $t1, $t0, 3       

 
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0        

 
    add $t3, $t1, $t2    


    la $t4, final_val     
    sw $t3, 0($t4)        


    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    lw $a0, final_val
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

