main:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	wzr, [sp, 44]
	b	.L2
.L5:
	str	wzr, [sp, 40]
	b	.L3
.L4:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 40]
	add	w0, w1, w0
	sxtw	x0, w0
	str	x0, [sp, 24]
	ldr	x1, [sp, 32]
	ldr	x0, [sp, 24]
	add	x0, x1, x0
	str	x0, [sp, 32]
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L3:
	ldr	w0, [sp, 40]
	cmp	w0, 9
	ble	.L4
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L2:
	ldr	w0, [sp, 44]
	cmp	w0, 9
	ble	.L5
	ldr	x1, [sp, 32]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret

