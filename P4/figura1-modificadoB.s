	.file	"figura1-modificadoB.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"R[0] = %i, R[39999] = %i\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$160072, %rsp
	.cfi_def_cfa_offset 160080
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 160056(%rsp)
	xorl	%eax, %eax
	call	clock_gettime
	leaq	52(%rsp), %r10
	movl	$1, %edx
	movl	$s+40000, %r9d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$s, %eax
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %esi
	addq	$32, %rax
	leal	(%rdx,%rsi,2), %r8d
	movl	-28(%rax), %esi
	addl	%edi, %r8d
	leal	(%rsi,%rsi,2), %edi
	movl	-24(%rax), %esi
	subl	%edx, %edi
	addl	%edi, %ecx
	leal	(%rdx,%rsi,2), %edi
	movl	-20(%rax), %esi
	addl	%edi, %r8d
	leal	(%rsi,%rsi,2), %esi
	subl	%edx, %esi
	leal	(%rsi,%rcx), %edi
	movl	-16(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %r8d
	movl	-12(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	leal	(%rcx,%rdi), %esi
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %edi
	movl	-4(%rax), %ecx
	addl	%r8d, %edi
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%esi, %ecx
	cmpq	%rax, %r9
	jne	.L3
	cmpl	%ecx, %edi
	jge	.L4
	movl	%edi, (%r10)
.L5:
	addl	$1, %edx
	addq	$4, %r10
	cmpl	$40001, %edx
	jne	.L2
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	48(%rsp), %edx
	movl	160044(%rsp), %ecx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	160056(%rsp), %rdx
	xorq	%fs:40, %rdx
	jne	.L11
	addq	$160072, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	movl	%ecx, (%r10)
	jmp	.L5
.L11:
	call	__stack_chk_fail
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
