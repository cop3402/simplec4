.file "stdin"
.text
.globl isodd
.type isodd, @function
isodd:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$16, %rsp
	push	%rbx
	# move parameters into the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generating code for an ifelsestmt
	# generate code for the expression
	# generate code for the left operand
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$3, %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the remainder
	cdq
	idiv	%rbx
	mov	%rdx, %rax
	# push the expression result
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$1, %rax
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
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$1, %rax
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
	# emit a jump to the end label
	jmp .L1
	# emit the else label
.L0:
	# generate code for the else branch
	# generating code for an ifelsestmt
	# generate code for the expression
	# generate code for the left operand
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$2, %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the remainder
	cdq
	idiv	%rbx
	mov	%rdx, %rax
	# push the expression result
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
	je .L2
	# generate code for the if branch
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$2, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# emit a jump to the end label
	jmp .L3
	# emit the else label
.L2:
	# generate code for the else branch
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$11, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# emit the end label
.L3:
	# emit the end label
.L1:
	# generate code for the return expression
	mov	-8(%rbp), %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
.text
.globl iseven
.type iseven, @function
iseven:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$16, %rsp
	push	%rbx
	# move parameters into the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the return expression
	# push the integer
	mov	$2, %rax
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
	sub	$48, %rsp
	push	%rbx
	# move argc and argv from parameter registers to the stack
	mov	%rdi, -32(%rbp)
	mov	%rsi, -40(%rbp)
	# generate code for the body
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$3, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -8(%rbp)
	# generate code for the right-hand side of the assignment
	# push the integer
	mov	$2, %rax
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -16(%rbp)
	# generate code for the right-hand side of the assignment
	# pass parameters either in registers or in stack
	# evaluate a parameter
	mov	-8(%rbp), %rax
	push	%rax
	# move a parameter to a register
	pop	%rdi
	# call the function
	call	isodd
	# restore the stack afterwards
	# push the return value
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generate code for the right-hand side of the assignment
	# pass parameters either in registers or in stack
	# evaluate a parameter
	mov	-16(%rbp), %rax
	push	%rax
	# move a parameter to a register
	pop	%rdi
	# call the function
	call	iseven
	# restore the stack afterwards
	# push the return value
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generate code for the right-hand side of the assignment
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	mov	-16(%rbp), %rax
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
	# generate code for the right-hand side of the assignment
	# pass parameters either in registers or in stack
	# evaluate a parameter
	mov	-8(%rbp), %rax
	push	%rax
	# move a parameter to a register
	pop	%rdi
	# call the function
	call	isodd
	# restore the stack afterwards
	# push the return value
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generate code for the right-hand side of the assignment
	# pass parameters either in registers or in stack
	# evaluate a parameter
	mov	-16(%rbp), %rax
	push	%rax
	# move a parameter to a register
	pop	%rdi
	# call the function
	call	iseven
	# restore the stack afterwards
	# push the return value
	push	%rax
	pop	%rax
	# move value to local variable
	mov	%rax, -24(%rbp)
	# generate code for the return expression
	mov	-16(%rbp), %rax
	push	%rax
	# save the return expression into %rax per the abi
	pop	%rax
	# emit main's epilogue
	pop	%rbx
	mov	%rbp, %rsp
	pop	%rbp
	ret
