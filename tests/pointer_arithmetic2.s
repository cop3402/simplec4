.file "stdin"
.text
.globl zzz
.type zzz, @function
zzz:
	# emit the function prologue
	push	%rbp
	mov	%rsp, %rbp
	sub	$16, %rsp
	push	%rbx
	# move parameters into the stack
	mov	%rdi, -8(%rbp)
	# generate code for the body
	# generate code for the return expression
	# generate code for the left operand
	mov	-8(%rbp), %rax
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$7, %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the addition
	add	%rbx, %rax
	# push the expression result
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
	mov	$1, %rax
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
	# generate code for the left operand
	# copy the base pointer to another register
	mov	%rbp, %rax
	# subtract the offset from the copy of the base pointer
	sub	$8, %rax
	# push the expression result
	push	%rax
	# generate code for the right operand
	# push the integer
	mov	$8, %rax
	push	%rax
	# pop the right operand
	pop	%rbx
	# pop the left operand
	pop	%rax
	# do the subtraction
	sub	%rbx, %rax
	# push the expression result
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
	call	zzz
	# restore the stack afterwards
	# push the return value
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
	mov	%rax, -24(%rbp)
	# generate code for the return expression
	# generate code for the unary operand
	mov	-24(%rbp), %rax
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
