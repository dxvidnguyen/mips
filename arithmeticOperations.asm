# CS 10 Lab 2
# Name: David Nguyen 
# Date: 05/05/2020
# Description: Create two integer variables myID and nLet. (Note: myID = sum 
#	of numbers from 8 digit ID number; nLet=number of letters of last name) 
#	Then have your program display the results for the 4 expressions
#	1)nLet + myID  2)nLet - myId  3)nLet * 4  4)even adjust(nLet + myId)/2
# Registers Used
# s0 - holds the value of myID
# s1 - holds the value of nLet
# t1 - holds result of expression 1: nLet + myID
# t2 - holds result of expression 2: nLet - myID\
# t3 - holds result of expression 3: nLet * 4 
# t4 - holds result of expression 4: even adjust(nLet + myID) /2

	.data
name_msg:	.asciiz "My family(last) name is Nguyen. \n"
id_msg:		.asciiz "My Student ID is 20341689 \n"
value_id_msg:	.asciiz "The value of myID is 39 \n"
value_name_msg:	.asciiz "The number of characters in my last name is 6 \n"
expression_msg:	.ascii "The expression result values will be in the temporary"
			" registers $t1 through $t4. \n"

	.text
main: 
	la $a0, name_msg	# load the addr of name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, id_msg		# load the addr of id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, value_id_msg	# load the addr of value_id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, value_name_msg	# load the addr of value_name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, expression_msg	# load the addr of value_name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	li $s0, 39		# load myID value into $s0
	li $s1, 6		# load nLet value into $s1
	
	add $t1, $s1, $s0	# $t1 = nLet + myID (expression 1)
	sub $t2, $s1, $s0	# $t2 = nLet - myID (expression 2)
	sll $t3, $s1, 2		# shifting by 2 is multiplying by 2^2
	
	addi $t4, $t1, 1	# compare with and operation 
	bne $t4, $zero, Else	# check if even or odd (exit if odd)
	srl $t4, $t4, 1		# divide even number by 2
	j Exit			# jump to Exit

Else: 	sub $t4, $t4, 1		# $t4 is odd so subtract one to make even
	srl $t4, $t4, 1		# shift right 1 postion to divide by 2

Exit: 	li $v0, 10 		# 10 is the exit syscall 
	syscall 		# do the syscall

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
