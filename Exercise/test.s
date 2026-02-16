	.arch armv8-a
	.file	"test.c"
	.text
	.align	2
	.global	insertionSort
	.type	insertionSort, %function
insertionSort:
	sub	sp, sp, #32
	str	x0, [sp, 8]
	str	w1, [sp, 4]
	mov	w0, 1
	str	w0, [sp, 28]
	b	.L2
.L6:
	ldrsw	x0, [sp, 28]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w0, [x0]
	str	w0, [sp, 20]
	ldr	w0, [sp, 28]
	sub	w0, w0, #1
	str	w0, [sp, 24]
	b	.L3
.L5:
	ldrsw	x0, [sp, 24]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x1, x1, x0
	ldrsw	x0, [sp, 24]
	add	x0, x0, 1
	lsl	x0, x0, 2
	ldr	x2, [sp, 8]
	add	x0, x2, x0
	ldr	w1, [x1]
	str	w1, [x0]
	ldr	w0, [sp, 24]
	sub	w0, w0, #1
	str	w0, [sp, 24]
.L3:
	ldr	w0, [sp, 24]
	cmp	w0, 0
	blt	.L4
	ldrsw	x0, [sp, 24]
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w0, [x0]
	ldr	w1, [sp, 20]
	cmp	w1, w0
	blt	.L5
.L4:
	ldrsw	x0, [sp, 24]
	add	x0, x0, 1
	lsl	x0, x0, 2
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldr	w1, [sp, 20]
	str	w1, [x0]
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L2:
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 4]
	cmp	w1, w0
	blt	.L6
	nop
	nop
	add	sp, sp, 32
	ret
	.size	insertionSort, .-insertionSort
	.ident	"GCC: (Arm GNU Toolchain 15.2.Rel1 (Build arm-15.86)) 15.2.1 20251203"
