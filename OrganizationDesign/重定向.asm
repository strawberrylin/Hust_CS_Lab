addi $s0, $zero, 1
add  $s1, $s1, $s0	
add  $s1, $s1, $s0
add  $s1, $s1, $s0
addi $v0,$zero,10         # system call for exit
syscall                   # we are out of here.   
