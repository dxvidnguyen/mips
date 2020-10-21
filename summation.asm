# CS Lab 6
# Name: David Nguyen 
# Date: 06/02/2020
# Description: Write a program to compute the value of the sum 1*2 + 2*3 + … + 
#	20*21.  Use the designated register to fetch the 32-bit product result.
#	Print the final result.
# Registers Used
# t0 - to represent the value of i (current number)
# t1 - to hold result sum 
# t2 - used in addition
	.data
name_msg:	.asciiz "My family(last) name is Nguyen. \n"
id_msg:		.asciiz "My Student ID is 20341689 \n"
result: 	.asciiz "\nThe result of series is : "

	.text
main: 
	la $a0, name_msg	# load the addr of name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, id_msg		# load the addr of id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	li $t0,1 		# set i=1
	li $t1,0		# start result sum at 0

loop:

	add $t2,$t0,1 		# t2 = i+1
	mul $t2,$t0,$t2 	# t2 = i*(i+1)
	add $t1,$t1,$t2		# s0 = (old cumultive) + current value 


	add $t0,$t0,1 		# i = i + 1
	ble $t0,20,loop 	# loop if i>10

	li $v0,4		# print_string syscall
	la $a0,result 		# prints the result string
	syscall

	li $v0,1		# print_int syscall
	move $a0,$t1		# prints the result
	syscall
	
	li $v0, 10 		# 10 is the exit syscall 
	syscall 		# do the syscall
	
	
	
	
	
	
	
	