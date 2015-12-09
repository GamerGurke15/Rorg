#iterativ

#Vorgehensweise:
# Register asl Programmvariablen
# Code for Funktion
# Register über Funktion hinweg beibehalten

#void swap(int v[], int k);
#v in $a0, k in $a1
swap:
  sll $t0, $a1, 2
  add $t0, $a0, $t0 #$t0 = &v[k]
  lw $t1, 0($t0)    #$t1 = v[k]
  lw $t2, 4($t0)    #$t2 = v[k+1]
  sw $t2, 0($t0)    #v[k] = $t2
  sw $t1, 4($t0)    #v[k+1] = $t1
  jr $ra            #return

#void sort(int v[], int k);
#v in $a0, k in $a1
sort:
  #ra im stack sichern
  #s register sind saved --> alte im stack sichern
  #i in s0, k in s1, n-1 in s2, n-1-i in s3, v in s4 
  addi $sp, $sp, -24
  sw $ra, 20($sp)
  sw $s0, 16($sp)
  #und so weiter
  move $s0, $0
  move $s4, $a0
  addi $s1, $a1, -1           #$s1 = n-1
for1: bge $s0, $s1, endfor1
    move $s2, $0
    sub $s3, $s1, $s0         #$s3 = n-1-i
for2: bge $s2, $s3, endfor2
      sll $t0, $s2, 2
      add $t0,$s4, $t0
      lw $t1, 0($t0)          #$t1 = v[j]
      lw $t2, 4($t0)          #$t2 = v[j+1]
      ble $t1, $t2, endif     #if v[j] <= v[j+1] go endif
        move $a0, $s4         #parameter für swap speichern
        move $a1, $s1
        jal swap              #swap aufrufen
endif:
      addi $s2, $s2, 1        #i++
      j for2
endfor2:
    addi $s0, $s0, 1          #j++
    j for1
endfor1:
  lw $ra, 20($sp)
  lw $s4, 16($sp)
  #und so weiter
  addi $sp, $sp, 24
  jr $ra


main:
  jal sort
