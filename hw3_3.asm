.data
prompt1:    .asciiz "Enter length: "
prompt2:    .asciiz "Enter width: "
resultMsg:  .asciiz "Perimeter: "
newline:    .asciiz "\n"

.text
.globl __start
.globl main

main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    move $a0, $t0
    move $a1, $t1
    jal calc_perimeter

    move $t2, $v0

    li $v0, 4
    la $a0, resultMsg
    syscall

    move $a0, $t2
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

calc_perimeter:
    addu $v0, $a0, $a1
    sll  $v0, $v0, 1
    jr   $ra
    nop

