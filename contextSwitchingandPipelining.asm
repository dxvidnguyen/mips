# CS 10 Lab 8
# Name: David Nguyen 
# Date: 06/16/2020
# Description: Multitasking and Context Switching; Pipelining
#	1) Multitasking and Context Switch:  Verify 2.1 Task 1 (lab8_CPUII) lab 
#		document.
#	2) Pipelining Task: See specification and requirements below.
# 

	.data
name_msg:	.asciiz "My family(last) name is Nguyen. \n"
id_msg:		.asciiz "My Student ID is 20341689 \n"
dummyArr: 	.word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26



	.text
main: 
	la $a0, name_msg	# load the addr of name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, id_msg		# load the addr of id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	
	li $2,0			# intialize $2 and $6
	li $6,0
    	
	la $3,dummyArr		# set the starting address of array to $3

	nop			# the first instruction uses $3 since very next  
	nop			# instruction, three nops required to avoid the
	nop			# data hazard

    	add $3,$2,$3	 	# execute the instruction 

	nop			# the second instruction uses $3
	nop  			# since very next instruction, three nops
	nop			# required to avoid the data hazard
	
	la $3,dummyArr		# execute the second instruction
			
	sub $7,$6,$2		# no previous reference, no nops required

	nop	 		# the last instruction uses $6
	nop	 		# since very next instruction, three nops
	nop	 		# required to avoid the data hazard

	xor $6,$4,$3		# perform the last instruction


	li $v0,10		# exit system
	syscall