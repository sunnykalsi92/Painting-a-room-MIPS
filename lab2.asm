#Sunny Kalsi
#lab 2
#
	
		.data	
length: 	.asciiz "\n Enter the lenght of the room (in feet): "
width: 		.asciiz "\n Enter the width of the room (in feet): "
hight: 		.asciiz "\n Enter the height of ceiling (in feet): "
priceWall: 	.asciiz "\n Enter the price of a gallon of wall paint: "
priceCeiling:  	.asciiz "\n Enter the price of a gallon of ceiling paint: "
name:		.asciiz "\n Sunny Kalsi. "
wallsf:		.asciiz "\n The total number of square feet of the walls is: "
wallgallon:	.asciiz "\n The total number of gallons of wall paint needed is: "
ceilingsf:	.asciiz "\n The total number of square feet of ceiling is: "
ceilinggallon:	.asciiz "\n The total number of gallons of ceiling paint needed is: "
wallcost:	.asciiz "\n The cost of wall paint will be $"
ceilingcost:	.asciiz "\n The cost of the ceiling paint will be $"
costtotal:	.asciiz "\n The total cost will be $"
bye:		.asciiz "\n*--- end of program ---*"
		.globl main
		.text
main:
		li	$v0, 4		# system call code for print string
		la	$a0, length	# load address of length in $a0
		syscall			#print prompt
		
		li $v0, 5		#system call code to read int
		syscall			#read length into $v0
		move $t1, $v0		#copy length into $t1
		
		li	$v0, 4		# system call code for print string
		la	$a0, width	# load address of width in $a0
		syscall			#print prompt
		
		li $v0, 5		#system call code to read int
		syscall			#read width into $v0
		move $t2, $v0		#copy width into $t2
		
		li	$v0, 4		# system call code for print string
		la	$a0, hight	# load address of hight in $a0
		syscall			#print prompt
		
		li $v0, 5		#system call code to read int
		syscall			#read hight into $v0
		move $t3, $v0		#copy hight into $t3
		
		li	$v0, 4		# system call code for print string
		la	$a0, priceWall	# load address of priceWall in $a0
		syscall			#print prompt
		
		li $v0, 5		#system call code to read int
		syscall			#read priceWall into $v0
		move $t4, $v0		#copy priceWall into $t4
		
		li	$v0, 4		# system call code for print string
		la	$a0, priceCeiling	# load address of length in $a0
		syscall			#print prompt
		
		li $v0, 5		#system call code to read int
		syscall			#read ceiling price into $v0
		move $t5, $v0		#copy ceiling price into $t5
				
		li	$v0, 4		#system call code for print string
		la	$a0, name	#load address of name in $a0
		syscall			#print prompt
		
		mult	$t1,$t3		#multiply length by hight
		mflo	$t6		#save result to $t6
		
		add	$t6, $t6, $t6	#double the square footage of one wall to get two walls
		
		mult	$t2,$t3		#multiple width by hight
		mflo	$t7		#save result to $t7
		
		add 	$t7, $t7, $t7	#doublt the square footage of other wall to get two walls
		
		add 	$t6, $t6, $t7	#add square footage of all walls to get total square feet of walls
		
		li 	$v0, 4		#system call code for print string
		la	$a0, wallsf	#load address of wallsf in $a0
		syscall			#print prompt
		
		li	$v0, 1		#system call to print integer
		la	$a0, ($t6)	#load address of square footage.
		syscall			#print prompt
		
		add	$t6, $t6, $t6	# double the square footage of walls because we need to do two coats of paint
		li	$t3, 325	#set reguster $t3 to how many feet can be painted by one gallon of paint
		div	$t6, $t3	#divide square footage of walls by 325
		mflo	$t7		#Store the quotient in $t7
		mfhi	$t8		#Store the remainder in $t8
		
		beqz $t8, next		#if T8 is 0 then it skips the next line
		addi	$t7, $t7, 1	#if T8 is not 0 then it adds one to T7 to round it up
		
next:		li 	$v0, 4		#system call code for print string
		la	$a0, wallgallon	#load address of wallsf in $a0
		syscall			#print prompt		
		
		li	$v0, 1		#system call to print integer
		la	$a0, ($t7)	#load address of gallons of wall paint needed.
		syscall			#print prompt
		
		mult	$t1, $t2	#multiply length by width to get celing square footage
		mflo	$t1		#save result to $t1
		
		li 	$v0, 4		#system call code for print string
		la	$a0, ceilingsf	#load address of ceilingsf in $a0
		syscall			#print prompt
		
		li	$v0, 1		#system call to print interger
		la	$a0, ($t1)	#load  address of ceiling square footage.
		syscall			#print prompt
		
		div	$t1, $t3	#Divivde square footage of ceiling by 325
		mflo	$t8		#store quotient in t8
		mfhi	$t9		#store remainder in t9
		
		beqz 	$t9, next1	#if T8 is 0 then it skips the next line
		addi	$t8, $t8, 1	#if T8 is not 0 then it adds one to T7 to round it up
		
next1:		li 	$v0, 4		#system call code for print string
		la	$a0, ceilinggallon	#load address of ceilinggallon in $a0
		syscall			#print prompt	
		
		li	$v0, 1		#system call to print interger
		la	$a0, ($t8)	#load address of ceiling gallons.
		syscall			#print prompt
		
		mult	$t7, $t4	#multiply wall gallons by wall price per gallon
		mflo	$t7		#save result to t7
		
		li 	$v0, 4		#system call code for print string
		la	$a0, wallcost	#load address of wallcost in $a0
		syscall			#print prompt
		
		li	$v0, 1		#system call to print interger
		la	$a0, ($t7)	#load address of wall cost
		syscall			#print prompt
			
		mult	$t8, $t5	#multiply ceiling gallons by ceiling price per gallon
		mflo	$t8		#save result to t8
		
		li 	$v0, 4		#system call code for print string
		la	$a0, ceilingcost	#load address of ceilingcost in $a0
		syscall			#print prompt
		
		li	$v0, 1		#system call to print interger
		la	$a0, ($t8)	#load address of ceiling paint cost.
		syscall			#print prompt	
		
		add 	$t7, $t7, $t8	#add ceiling cost and wall cost to get total cost
		
		li 	$v0, 4		#system call code for print string
		la	$a0, costtotal	#load address of costtotal in $a0
		syscall			#print prompt
		
		li	$v0, 1		#system call to print interger
		la	$a0, ($t7)	#load address of total paint cost
		syscall			#print prompt
		
		li	$v0, 4		# system call code for print string
		la	$a0, bye	# load address of bye in $a0
		syscall			#print prompt
