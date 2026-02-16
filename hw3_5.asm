.data
promptA: .asciiz "Enter a: "
promptB: .asciiz "Enter b: "
msg:     .asciiz "Average of squares: "
nl:      .asciiz "\n"

.text
.globl main

main:
    # prompt for a
    li $v0, 4
    la $a0, promptA
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    # prompt for b
    li $v0, 4
    la $a0, promptB
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    # call average_of_squares(a, b)
    move $a0, $t0
    move $a1, $t1
    jal average_of_squares

    move $t2, $v0

    # print result
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall


square:
    mul  $v0, $a0, $a0
    jr   $ra
    nop


average_of_squares:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    move $t0, $a0
    jal  square
    move $t1, $v0

    move $a0, $a1
    jal  square
    move $t2, $v0

    addu $v0, $t1, $t2
    sra  $v0, $v0, 1

    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    jr   $ra
    nop

