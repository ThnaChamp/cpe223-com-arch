	.arch armv8-a
	.file	"ps02.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	mov	w0, 44
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	str	wzr, [sp, 40]
	str	wzr, [sp, 36]
	mov	w0, 1
	str	w0, [sp, 32]
	b	.L2
.L3:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 40]
	add	w0, w1, w0
	str	w0, [sp, 36]
	ldr	w0, [sp, 44]
	str	w0, [sp, 40]
	ldr	w0, [sp, 36]
	str	w0, [sp, 44]
	ldr	w0, [sp, 32]
	add	w0, w0, 1
	str	w0, [sp, 32]
.L2:
	ldr	w1, [sp, 32]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L3
	ldr	w1, [sp, 36]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Arm GNU Toolchain 15.2.Rel1 (Build arm-15.86)) 15.2.1 20251203"
