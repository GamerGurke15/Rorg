	.text
	.globl main
	
main:
	or $t6, $0, $a0
	or $t7, $0, $a1
	
	ori $a0, $0, 0x4
	ori $a1, $0, 0x5
	
	
	or $t0, $0, $0				#count in t0 as result
	or $t1, $0, $0				#i in t1
	
	for:
	bge $t3, $a1, afterfor			#for jmp
	
		sll $t2, $t1, 0x2		#shifting by 2 for i*4
		add $t2, $a0, $t1		#getting address of table[i]
		lw $t3, 0x0($t2)		#load table[i] in t3
			bgez $t3, afterif		#do if
			addi $t0, $t0, 0x1		#inc count
		afterif:
		
	addi $t1, $t1, 0x1			#inc i
	j for
	afterfor:
	or $v0, $t0, $0
	
	or $a0, $0, $t6
	or $a1, $0, $t7
	
	

#	int ocuntNegatives(int table[], int n){
#		int count = 0;
#		for (int i = 0;i<n;i++)
#			if (table[i]<0)
#				count++;
#		return count;
#	}	
