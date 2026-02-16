.data
newline: .asciiz "\n"

.text
.globl main

main:
    li  $a0, 4
    jal square_plus_one

    move $a0, $v0
    li   $v0, 1
    syscall

    li  $v0, 4
    la  $a0, newline
    syscall

    li $v0, 10
    syscall


square_plus_one:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $t0, 0($sp)

    move $t0, $a0
    mul  $t0, $t0, $t0
    addi $v0, $t0, 1

    lw   $t0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8

    jr   $ra
    nop

