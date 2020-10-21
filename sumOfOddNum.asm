# CS Lab 4 
# Name: David Nguyen 
# Date: 05/12/2020
# Description: Write a program that will prompt and read a value given by the 
#	user. Compute the sum of all odd integers from 1 to the value (inclusive),
#	depending on if the top number is even or odd
#	Note: Use 12 for the top value 
# Registers Used
# s0 - holds the input value from user (and subtracts one if odd)
# t1 - holds the value in the loop to compare to $s0 value
# t2 - holds sum of odd number to print out when done



	.data
name_msg:	.asciiz "Family Name: Nguyen \n"
id_msg:		.asciiz "Student ID: 20341689 \n"
prompt: 	.asciiz "Enter top value: "
result: 	.asciiz "Computed sum of odd integers up to top value: "
	.text
main: 
	la $a0, name_msg	# load the addr of name_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, id_msg		# load the addr of id_msg into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, prompt 		# load addr of prompt into $a0	
	li $v0, 4		# load print_string syscall
	syscall 		# print prompt 
	
	li $v0, 5		# load read_int 
	syscall 		# use read_int to read supplied int
	move $s0, $v0 		# store value of int in $s0

	andi $t0, $s0, 1 	# use andi to compare
	beqz $t0, Even		# branch if it is an even number
	j ComputeLoop		# jump to ComputeLoop 
	
Even:	sub $s0, $s0, 1 	# correct even top value to be odd
  	
ComputeLoop: 
	li $t1, 1		# starting value for comparing
	li $t2, 1 		# starting value for sum 
start:	
	beq $t1, $s0, end  	# branch to end when past top value 
	addi $t1, $t1, 2 	# add 2 to comparison value
	add $t2, $t2, $t1	# add current value of $t1 to sum 
	b start			# branch to top of loop
	
end: 
	
	la $a0, result		# load addr of result to $a0
	li $v0, 4		# load print_string
	syscall			# perform syscall
	
	move $a0, $t2 		# move value of $t2 into $a0 to print
	li $v0, 1		# load print_int
	syscall			# do syscall
	
	













































