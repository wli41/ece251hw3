.data
prompt:  .asciiz "Enter n: "
msg:     .asciiz "n! = "
nl:      .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal factorial

    move $t0, $v0

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall


factorial:
    addi $sp, $sp, -8
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)

    slt  $t0, $a0, 1
    bne  $t0, $zero, fact_base
    nop

    addi $a0, $a0, -1
    jal  factorial

    lw   $t1, 0($sp)
    mul  $v0, $t1, $v0
    j    fact_epilogue
    nop

fact_base:
    li   $v0, 1

fact_epilogue:
    lw   $a0, 0($sp)
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra
    nop

