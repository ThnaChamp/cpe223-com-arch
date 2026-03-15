main:
	sub	sp, sp, #32
	mov	w0, 10
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	add	w0, w0, 30 
	str	w0, [sp, 24]
	mov	w0, 20
	str	w0, [sp, 20]
	ldr	w0, [sp, 20]
	add	w0, w0, 20
	str	w0, [sp, 16]
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 20]
	add	w1, w1, w0
	ldr	w0, [sp, 24]
	add	w0, w1, w0
	ldr	w1, [sp, 16]
	add	w0, w1, w0
	str	w0, [sp, 12]
	ldr	w0, [sp, 12]
	add	sp, sp, 32
	ret
