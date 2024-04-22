.file "stdin"
.text
.globl funct
.type funct, @function
funct:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$32, %rsp
	push	%rbx
	# move parameters into the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$3, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -16(%rbp)
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$1, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generating code for an ifelsestmt
	# generate code for the expression
	# generate code for the left operand
	# push the integer
	mov	$1, %rax
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$0, %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# push the expression result
	push	%rax
	# emit a pop of the expression value from the stack into a register
	pop	%rax
	# emit a cmp of register's value to 0, i.e., check whether it's false
	cmp $0, %rax
	# emit a je to the else label
	je .L0
	# generate code for the if branch
	# generate code for the right-hand side of the assignment
	# generate code for the left operand
	mov	-16(%rbp), %rax
	push	%rax
	# generate code for the right operand
	mov	-8(%rbp), %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the addition
	add	%rbx, %rax
	# push the expression result
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -16(%rbp)
	# emit a jump to the end label
	jmp .L1
	# emit the else label
.L0:
	# generate code for the else branch
	# generating code for an ifelsestmt
	# generate code for the expression
	# emit a pop of the expression value from the stack into a register
	pop	%rax
	# emit a cmp of register's value to 0, i.e., check whether it's false
	cmp $0, %rax
	# emit a je to the else label
	je .L2
	# generate code for the if branch
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$0, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -16(%rbp)
	# emit a jump to the end label
	jmp .L3
	# emit the else label
.L2:
	# generate code for the else branch
	# generate code for the right-hand side of the assignment
	# generate code for the left operand
	mov	-16(%rbp), %rax
	push	%rax
	# generate code for the right operand
	mov	-8(%rbp), %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the multiplication
	imul	%rbx, %rax
	# push the expression result
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -16(%rbp)
	# emit the end label
.L3:
	# emit the end label
.L1:
	# generate code for the return expression
	mov	-16(%rbp), %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
.text
.globl main
.type main, @function
main:
	# stack space for argc and argv
	# emit main's prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$64, %rsp
	push	%rbx
	# move argc and argv from parameter registers to the stack
	mov	%rdi, -48(%rbp)
	mov	%rsi, -56(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$1, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# pass parameters either in registers or in stack
	# evaluate a parameter
	mov	-8(%rbp), %rax
	push	%rax
	# move a parameter to a register
	pop	%rdi
	# call the function
	call	funct
	# restore the stack afterwards
	# push the return value
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the addition
	add	%rbx, %rax
	# push the expression result
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# copy the base pointer to another register
	mov	%rbp, %rax
	# subtract the offset from the copy of the base pointer
	sub	$8, %rax
	# push the expression result
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -40(%rbp)
	# generate code for the deref on the left side of an expression
	mov	-40(%rbp), %rax
	push	%rax
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$7, %rax
	push	%rax
	# pop the result of the right-hand side
	pop	%rax
	# pop the result of the left-hand side
	pop	%rbx
	# move the right-hand side's value into the address pointed to by the left-hand side
	mov	%rax, (%rbx)
	# generate code for the right-hand side of the assignment
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# generate code for the unary operand
	mov	-40(%rbp), %rax
	push	%rax
	# pop the unary operand
	pop	%rax
	# move the contents of the address to the result register
	mov	(%rax), %rbx
	# push the expression result
	push	%rbx
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the addition
	add	%rbx, %rax
	# push the expression result
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$1, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generating code for a whilestmt
	# emit the head label
.L4:
	# generate code for the expression
	mov	-24(%rbp), %rax
	push	%rax
	# emit a pop of the expression value from the stack into a register
	pop	%rax
	# emit a cmp of register's value to 0, i.e., check whether it's false
	cmp $0, %rax
	# emit a je to the end label
	je .L5
	# generate code for the while body
	# generating code for an ifelsestmt
	# generate code for the expression
	mov	-24(%rbp), %rax
	push	%rax
	# emit a pop of the expression value from the stack into a register
	pop	%rax
	# emit a cmp of register's value to 0, i.e., check whether it's false
	cmp $0, %rax
	# emit a je to the else label
	je .L6
	# generate code for the if branch
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$0, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# emit a jump to the end label
	jmp .L7
	# emit the else label
.L6:
	# generate code for the else branch
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$1, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# emit the end label
.L7:
	# generate code for the deref on the left side of an expression
	mov	-40(%rbp), %rax
	push	%rax
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$8, %rax
	push	%rax
	# pop the result of the right-hand side
	pop	%rax
	# pop the result of the left-hand side
	pop	%rbx
	# move the right-hand side's value into the address pointed to by the left-hand side
	mov	%rax, (%rbx)
	# emit a jump to the head label
	jmp .L4
	# emit the end label
.L5:
	# generate code for the return expression
	# generate code for the unary operand
	mov	-40(%rbp), %rax
	push	%rax
	# pop the unary operand
	pop	%rax
	# move the contents of the address to the result register
	mov	(%rax), %rbx
	# push the expression result
	push	%rbx
	# save the return expression into %rax per the abi
	pop	%rax
	# emit main's epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
