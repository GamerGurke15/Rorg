clip:
	ori $t0, $0, 0x0			#i
	ori $t7, $0, 0xA			#hardcoded 10
	
	for_begin:
	bge $t0, $a1, after_for
		sll $t1, $t0, 0x2	#i*4
		add $t2, $a0, $t1	#a+i*4
		lw $t3, 0($t2)		#a[i]
		
		bge $t3, $t7, after_if
			sw $t7, 0($t2)
		after_if:
		addi $t0, $t0, 0x1
		j for_begin
	after_for:

jr $ra




#
# Some Parameters
#


	.data
array: .word -1, 0, 78, 14, 9, 13, -18, 55, -8, 48, -11, 11
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

	jal	clip

	move	$s1, $v0

	move	$a0, $s1

#	li	$v0, 1
#	syscall


	lw	$ra, 0($sp)
	addi	$sp, $sp, 4
	jr	$ra

#
# end main
#
