	.file	"SumaVectoresC.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan n\302\272 componentes del vector"
	.align 8
.LC3:
	.string	"Tiempo(seg.):%11.9f\t / Tama\303\261o Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L14
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$33554432, %ebp
	call	strtol
	cmpl	$33554432, %eax
	cmovbe	%eax, %ebp
	testl	%ebp, %ebp
	je	.L3
	pxor	%xmm1, %xmm1
	leal	-1(%rbp), %eax
	xorl	%ebx, %ebx
	movsd	.LC1(%rip), %xmm3
	movq	%rax, %r12
	addq	$1, %rax
	cvtsi2sd	%ebp, %xmm1
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L4:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm7
	cvtsi2sd	%ebx, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm2
	subsd	%xmm0, %xmm7
	addsd	%xmm1, %xmm2
	movsd	%xmm7, v2(,%rbx,8)
	movsd	%xmm2, v1(,%rbx,8)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L4
	movq	%rsp, %rsi
	xorl	%edi, %edi
	salq	$3, %rbx
	call	clock_gettime
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	v1(%rax), %xmm0
	addq	$8, %rax
	addsd	v2-8(%rax), %xmm0
	movsd	%xmm0, v3-8(%rax)
	cmpq	%rax, %rbx
	jne	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	%r12d, %edx
	pxor	%xmm0, %xmm0
	movl	%r12d, %ecx
	movsd	v3(,%rdx,8), %xmm6
	movl	%r12d, %r9d
	movsd	v2(,%rdx,8), %xmm5
	movl	%r12d, %r8d
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	movsd	v1(,%rdx,8), %xmm4
	movsd	v3(%rip), %xmm3
	movl	%ebp, %edx
	movsd	v2(%rip), %xmm2
	movl	$.LC3, %esi
	movl	$1, %edi
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC2(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$7, %eax
	addsd	%xmm1, %xmm0
	movsd	v1(%rip), %xmm1
	call	__printf_chk
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L15
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	movq	%rsp, %rsi
	xorl	%edi, %edi
	orl	$-1, %r12d
	call	clock_gettime
	jmp	.L6
.L14:
	movl	$.LC0, %edi
	call	puts
	orl	$-1, %edi
	call	exit
.L15:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.comm	v3,268435456,32
	.comm	v2,268435456,32
	.comm	v1,268435456,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
