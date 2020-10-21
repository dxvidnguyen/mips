# Name: David Nguyen 
# Date: 06/09/2020
# Description: Write your own exception handler that prints the address of the 
# 	instruction that caused the exception, the exception code and an 
#	accompanying message
# Registers Used
# k0, k1 - used by handler without having to save or restore values 



#Data section for kernel
.kdata
#declare the string varaibles
kernalRegs: .word 0:3
string1: .asciiz   "Exception caused by instruction at Address: "
string2: .asciiz   "\tException Code = "
string3: .asciiz   "\nIgnore and continue program ...\n"

.ktext 0x80000180	#start at the fixed address 0x80000180

move   $k1, $at		#move the start address in the kernel register
la $k0, kernalRegs
sw $a0, 0($k0)		#store the value of $a0 in 1st index of $k0
sw $k1, 4($k0)		#store the value of $k1 in 2nd index of $k0
sw $v0, 8($k0)		#store the value of $v0 in 3rd index of $k0
  
li $v0, 4		
la $a0, string1		 #print string1
syscall
  
li $v0, 34		 #print the hexadecimal address
mfc0   $a0, $14		 #Load code to print value in hexadecimal
syscall		
   
li $v0, 4
la $a0, string2		#print string2
syscall
  
#print the integer code
li $v0, 1
mfc0   $a0, $13 	#load the cause register value ($13)
srl    $a0, $a0, 2 	#shift the bits 2 position right
andi   $a0, $a0, 31 	#perform and operation to get the bits from 6-2
syscall
  
#print string3
li $v0, 4
la $a0, string3
syscall
  
  
la     $k0, kernalRegs  #Load kernalRegs
lw     $a0, 0($k0) 	#load the value in 1st index of $k0 into $a0  
lw     $at, 4($k0) 	#load the value in 2nd index of $k0 into $at
lw     $v0, 8($k0)  	#load the value in 3rd index of $k0 into $v0
  
  
mtc0   $0, $8  		#clear the value of the register vaddr ($8)
mfc0   $k1, $14 		#Set value of the register epc ($14)
addiu  $k1, $k1, 4  	#Increment value of k1 by 4
mtc0   $k1, $14  		#Set value of the register epc ($14)
  
eret  			#Return value
