	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"/dev/usbtmc0"
.LC1:
	.string	"fd=%d "
.LC2:
	.string	"READ?\n"
.LC3:
	.string	"\nV=%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movl	%edi, -308(%rbp)
	movq	%rsi, -320(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -300(%rbp)
	jmp	.L2
.L3:
	movl	-300(%rbp), %eax
	cltq
	movq	$0, -272(%rbp,%rax,8)
	addl	$1, -300(%rbp)
.L2:
	cmpl	$31, -300(%rbp)
	jle	.L3
	movl	$2, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -296(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
.L8:
	movl	-296(%rbp), %eax
	movl	$6, %edx
	movl	$.LC2, %esi
	movl	%eax, %edi
	call	write
	movq	%rax, -288(%rbp)
	leaq	-272(%rbp), %rcx
	movl	-296(%rbp), %eax
	movl	$32, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read
	movq	%rax, -280(%rbp)
	cmpq	$0, -288(%rbp)
	jns	.L4
	movl	-296(%rbp), %eax
	movl	%eax, %edi
	call	close
	movl	$-1, -296(%rbp)
	jmp	.L5
.L6:
	movl	-296(%rbp), %eax
	cltq
	movl	$100, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	poll
	movl	%eax, -292(%rbp)
	movl	-296(%rbp), %eax
	movl	%eax, %edi
	call	close
	movl	$2, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -296(%rbp)
.L5:
	cmpl	$-1, -296(%rbp)
	je	.L6
	jmp	.L8
.L4:
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	jmp	.L8
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
