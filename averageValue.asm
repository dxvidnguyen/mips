# CS Lab 5
# Name: David Nguyen 
# Date: 05/26/2020
# Description: Write a program that calls a procedure to calculate the average 
#	of two values. Initialize the two values to be averaged in main. 
#	Pass these two values as parameters on the stack to the average 
#	procedure. Compute the average of the two value parameters in the
#	procedure. Use the stack to pass the result back to main.

	.data
name_msg:	.asciiz "Family Name: Nguyen \n"
id_msg:		.asciiz "Student ID: 20341689 \n"
result_msg:	.asciiz "Average number result is: "

	.text
	
	.globl main
	
# main function
main: 
	la $a0, name_msg	# load the addr of name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, id_msg		# load the addr of id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	li $s0, 12		# load 12 into reg $s0
	li $s1, 16		# load 16 into reg $s1
	
	addiu $sp, $sp, 24	# create a stack
	sw $s0, 4($sp)		# store $s0 into the stack 
	sw $s1, 8($sp)		# store $s1 onto the stack
	
	jal dn_avg		# call the average function
	
	lw $t7, ($sp)		# load $t7 with result from stack
	
	la $a0, result_msg	# load the addr of result_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	li $v0, 1		# print int syscall
	move $a0, $t7		# move $t7 to be printed
	syscall			# perform syscall
	
	addu $sp, $sp, 24	# destroy the stack
	li $v0, 10 		# 10 is the exit syscall 
	syscall 		# do the syscall

# average function	
dn_avg:
	lw $t1, 4($sp)		# load parameters from stack into reg
	lw $t2, 8($sp)
	
	add $t0, $t1, $t2	# add numbers and store in $t0
	srl $t0, $t0, 1		# divide by 2
	
	sw $t0, ($sp)		# store result on top of stack
	li $t0, 9		# storing the last number of id onto $t0
	jr $ra 			# return to main function
	
	
	










