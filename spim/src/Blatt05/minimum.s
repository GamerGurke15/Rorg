minimum:
	ori $t0, $0, 0x1			#i
	lw $v0, 0($a0)
	
	for_begin:
	bge $t0, $a1, after_for
		sll $t1, $t0, 0x2	#i*4
		add $t2, $a0, $t1	#a+i*4
		lw $t2, 0($t2)		#a[i]
		
		bge $t2, $v0, after_if
			or $v0, $0, $t2
		after_if:
		addi $t0, $t0, 0x1
		j for_begin
	after_for:
jr	$ra



#
# Some Parameters
#


	.data
array: .word -5, -17, -3, 22, 120, -1, 14, -254, -574, 0, 7, -97
n:     .word 12


#
# main
#

	.text
	.globl main

main:
	addi	$sp, $sp, -4		# save return adress
	sw	$ra, 0($sp)

	la	$a0, array		# array adress
	lw	$a1, n		  

	jal	minimum

	move	$s1, $v0

	move	$a0, $s1

	li	$v0, 1
	syscall


	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra

#
# end main
#



