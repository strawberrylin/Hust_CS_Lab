.text
#nop
nop
nop
nop
nop
nop
 #close interrupt
 mfc0 $k0, $12
 ori $k0, $k0, 1
 mtc0 $k0, $12
 
 # save 
 addu $sp, $0, $0
 addi $sp, $sp, 128
 sw $s0, 0($sp)
 addi $sp, $sp, 4
 
 # status
 mfc0 $s0, $12
 sra $s0, $s0, 1
 sll $s0, $s0, 1
 sw $s0, 0($sp)
 addi $sp, $sp, 4
 
 sw $s1, 0($sp)
 addi $sp, $sp, 4
 sw $v0, 0($sp)
 addi $sp, $sp, 4
 sw $a0, 0($sp)
 addi $sp, $sp, 4
 sw $k0, 0($sp)
 addi $sp, $sp, 4
 
 # epc
 mfc0 $s0, $14
 sw $s0, 0($sp)
 addi $sp, $sp, 4
 
 
 # 设置屏蔽码
 mfc0 $s1, $13
 addi $s0, $0, 1
 beq $s1, $s0, m_1
 addi $s0, $0, 2
 beq $s1, $s0, m_2
 addi $s0, $0, 3
 beq $s1, $s0, m_3
m_1:
 addi $s1, $0, 3
 mtc0 $s1, $12
 addi $s1, $0, 1
 beq $s1, $s0, m_end
m_2:
 addi $s1, $0, 7
 mtc0 $s1, $12
 addi $s1, $0, 2
 beq $s1, $s0, m_end
m_3:
 addi $s1, $0, 0xf
 mtc0 $s1, $12
 addi $s1, $0, 3
 beq $s1, $s0, m_end
m_end: 
 #open interrupt
 mfc0 $k0, $12
 sra $k0, $k0, 1
 sll $k0, $k0, 1
 mtc0 $k0, $12
 
 mfc0 $s1, $13
 addi $s0, $0, 1
 beq $s1, $s0, break_1
 addi $s0, $0, 2
 beq $s1, $s0, break_2
 addi $s0, $0, 3
 beq $s1, $s0, break_3
 addi $s0, $0, 0
 beq $s0, $0, end
 
break_1:
 addi $s1, $0, 0
 addi $v0, $0, 34
loop_1:
 addi $a0, $s0, 0
 syscall
 sll $s0, $s0, 4
 bne $s1, $s0, loop_1
 addi $s0, $0, 1
 sll $s0, $s0, 28
loop_1_2:
 addi $a0, $s0, 0
 syscall
 sra $s0, $s0, 4
 bne $s1, $s0, loop_1_2
 beq $s1, $s0, end
 
break_2:
 addi $s1, $0, 0
 addi $v0, $0, 34
loop_2:
 addi $a0, $s0, 0
 syscall
 sll $s0, $s0, 4
 bne $s1, $s0, loop_2
 addi $s0, $0, 2
 sll $s0, $s0, 28
loop_2_2:
 addi $a0, $s0, 0
 syscall
 sra $s0, $s0, 4
 bne $s1, $s0, loop_2_2
 beq $s1, $s0, end
 
break_3:
 addi $s1, $0, 0
 addi $v0, $0, 34
loop_3:
 addi $a0, $s0, 0
 syscall
 sll $s0, $s0, 4
 bne $s1, $s0, loop_3
 addi $s0, $0, 3
 sll $s0, $s0, 28
loop_3_2:
 addi $a0, $s0, 0
 syscall
 sra $s0, $s0, 4
 bne $s1, $s0, loop_3_2
 
end:
 addi $a0, $0, 0
 syscall
 #close interrupt
 mfc0 $k0, $12
 ori $k0, $k0, 1
 mtc0 $k0, $12
 
 
 # epc
 addi $sp, $sp, -4
 lw $s0, 0($sp)
 mtc0 $s0, $14
 
 addi $sp, $sp, -4
 lw $k0, 0($sp)
 addi $sp, $sp, -4
 lw $a0, 0($sp)
 addi $sp, $sp, -4
 lw $v0, 0($sp)
 addi $sp, $sp, -4
 lw $s1, 0($sp)
 
 # status
 addi $sp, $sp, -4
 lw $s0, 0($sp)
 ori $s0, $s0, 1
 mtc0 $s0, $12
 
 addi $sp, $sp, -4
 lw $s0, 0($sp)
 addi $sp, $sp, -128
 
 #open interrupt
 mfc0 $k0, $12
 sra $k0, $k0, 1
 sll $k0, $k0, 1
 mtc0 $k0, $12
 eret
 
