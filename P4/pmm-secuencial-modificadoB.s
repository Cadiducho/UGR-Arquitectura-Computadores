	.file	"pmm-secuencial-modificadoB.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	printMatriz
	.type	printMatriz, @function
printMatriz:
.LFB60:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L8
	leal	-1(%rdi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	4(%rsi,%rax,4), %r14
	leaq	4(,%rax,4), %r13
	.p2align 4,,10
	.p2align 3
.L3:
	leaq	0(%r13,%r12), %rbp
	movq	%r12, %rbx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$1, %edi
	addq	$4, %rbx
	call	__printf_chk
	cmpq	%rbp, %rbx
	jne	.L4
	movl	$10, %edi
	addq	$4, %r12
	call	putchar
	cmpq	%r14, %r12
	jne	.L3
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
.L8:
	rep ret
	.cfi_endproc
.LFE60:
	.size	printMatriz, .-printMatriz
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"ERROR: falta numero de filas y columnas\n"
	.section	.rodata.str1.1
.LC3:
	.string	"M1:"
.LC4:
	.string	"M2:"
.LC5:
	.string	"Sol:"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.text.unlikely
.LCOLDB8:
	.section	.text.startup,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB61:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L33
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, 8(%rsp)
	movl	%eax, %r12d
	imull	8(%rsp), %eax
	leaq	63(,%rax,4), %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	leaq	63(%rax), %r13
	movq	%rax, %rbx
	call	malloc
	movq	%rbp, %rdi
	leaq	63(%rax), %r15
	movq	%rax, %r14
	call	malloc
	leaq	63(%rax), %r8
	movq	%rax, %rbp
	movl	8(%rsp), %eax
	andq	$-64, %r13
	andq	$-64, %r15
	andq	$-64, %r8
	testl	%eax, %eax
	je	.L12
	xorl	%eax, %eax
	xorl	%esi, %esi
.L14:
	leal	(%r12,%rax), %ecx
	.p2align 4,,10
	.p2align 3
.L13:
	movl	%eax, %edx
	addl	$1, %eax
	cmpl	%eax, %ecx
	movl	$0, 0(%r13,%rdx,4)
	movl	$2, (%r15,%rdx,4)
	movl	$1, (%r8,%rdx,4)
	jne	.L13
	addl	$1, %esi
	movl	%ecx, %eax
	cmpl	%esi, %r12d
	jne	.L14
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	movq	%r8, (%rsp)
	call	clock_gettime
	movl	8(%rsp), %edi
	movq	(%rsp), %r8
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r13, 16(%rsp)
	movq	%r15, 24(%rsp)
	xorl	%r11d, %r11d
	movl	%eax, %r13d
	movl	%esi, %r15d
.L23:
	movl	%r15d, %esi
	movl	%r11d, %r10d
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%r10d, %eax
	movq	%r8, (%rsp)
	movl	(%r14,%rax,4), %r9d
	movl	%r11d, %eax
	.p2align 4,,10
	.p2align 3
.L16:
	leal	(%rsi,%rax), %ecx
	movl	%eax, %edx
	addl	$1, %eax
	movl	0(%rbp,%rcx,4), %r8d
	imull	%r9d, %r8d
	addl	%r8d, (%rbx,%rdx,4)
	cmpl	%eax, %edi
	jne	.L16
	addl	$1, %r10d
	addl	%r12d, %esi
	movq	(%rsp), %r8
	cmpl	%edi, %r10d
	jne	.L19
	addl	$1, %r13d
	addl	%r12d, %r11d
	subl	%r12d, %r15d
	cmpl	%r13d, %r12d
	leal	(%r10,%r12), %edi
	jne	.L23
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	movq	%r8, (%rsp)
	movq	16(%rsp), %r13
	movq	24(%rsp), %r15
	call	clock_gettime
	cmpl	$14, 8(%rsp)
	movq	(%rsp), %r8
	jbe	.L22
	movq	8(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	0(%r13), %edx
	movl	$.LC7, %esi
	movl	$1, %edi
	leal	-2(%rax,%rax), %eax
	movl	0(%r13,%rax,4), %ecx
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC6(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
.L21:
	movq	%rbx, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L34
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	movq	%r8, (%rsp)
	call	clock_gettime
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	(%rsp), %r8
.L22:
	movl	$.LC3, %edi
	movq	%r8, (%rsp)
	call	puts
	movq	%r15, %rsi
	movq	8(%rsp), %r15
	movl	%r15d, %edi
	call	printMatriz
	movl	$.LC4, %edi
	call	puts
	movq	(%rsp), %r8
	movl	%r15d, %edi
	movq	%r8, %rsi
	call	printMatriz
	movl	$.LC5, %edi
	call	puts
	movq	%r13, %rsi
	movl	%r15d, %edi
	call	printMatriz
	jmp	.L21
.L33:
	movq	stderr(%rip), %rcx
	movl	$.LC2, %edi
	movl	$40, %edx
	movl	$1, %esi
	call	fwrite
	movl	$1, %edi
	call	exit
.L34:
	call	__stack_chk_fail
	.cfi_endproc
.LFE61:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE8:
	.section	.text.startup
.LHOTE8:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
