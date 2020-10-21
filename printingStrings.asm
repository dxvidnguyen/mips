# CS 10 Lab 2
# Name: David Nguyen 
# Date: 04/28/2020
# Description: Code and run a "hello world!" program in MARS MIPS simulator 
#	and include the following details: last name, foothill ID, 3 details 
# 	from syllabus 

	.data 
hello_msg:	.asciiz "Hello World!\n"
lastName:	.asciiz "My last name is: Nguyen\n"
foothillNumber: .asciiz "My Foothill ID Number: 20341689\n" 
syllabusInfo: 	.ascii  "Below are 3 syllabus details: \n"
		       	" 1) Labs will be avaible on Wednesday at 8am and"
			" due Tuesday next week at 11:59pm. \n"
			" 2) Midterm is a one hour timed exam on that will"
			" be done on the sixth week. \n"
			" 3) Assignments can be up to 2 days late, with a"
			" penalty each late day while late exams will not"
			" be accepted. \n"
				 

	.text
main: 
	la $a0, hello_msg	# load the addr of the hello_msg into $a0
	li $v0, 4		# 4 is the print_string syscall 
	syscall			# do the syscall
	
	la $a0, lastName	# load the addr of lastName into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, foothillNumber 	# load mem addr of foothillNumber to $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	la $a0, syllabusInfo	# load mem addr of syllabusInfo into $a0
	li $v0, 4		# print_string syscall
	syscall			# do syscall
	
	li $v0, 10 		# 10 is the exit syscall 
	syscall 		# do the syscall		 