	.arch armv8-a
	.file	"pipeline_02.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.align	3
.LC1:
	.string	"Error"
	.align	3
.LC2:
	.string	"A"
	.align	3
.LC3:
	.string	"B"
	.align	3
.LC4:
	.string	"C"
	.align	3
.LC5:
	.string	"D"
	.align	3
.LC6:
	.string	"F"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	mov	w0, 80
	str	w0, [sp, 16]
	mov	w0, 70
	str	w0, [sp, 20]
	mov	w0, 60
	str	w0, [sp, 24]
	mov	w0, 50
	str	w0, [sp, 28]
	add	x0, sp, 16 		# การบวก จุดเริ่มต้นไป 16 เพื่อเริ่มทำงาน instruction อื่น ๆ
	add	x0, x0, 8 		# c = b + 2 - บวก 2 ช่องคือ 4 * 2 = 8
	str	x0, [sp, 40] 	# เก็บไว้ที่ c ไว้ที่ 40
	add	x0, sp, 36		
	mov	x1, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	scanf
	ldr	w0, [sp, 36]
	cmp	w0, 100
	ble	.L2
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	b	.L3
.L2:
	ldr	w0, [sp, 36]
	cmp	w0, 80
	ble	.L4
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	b	.L3
.L4:
	ldr	w1, [sp, 20]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	bge	.L5
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	b	.L3
.L5:
	ldr	x0, [sp, 40]
	ldr	w1, [x0]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	bge	.L6
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	b	.L3
.L6:
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 36]
	cmp	w1, w0
	bgt	.L7
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	b	.L3
.L7:
	ldr	w0, [sp, 36]
	cmp	w0, 0
	blt	.L8
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	b	.L3
.L8:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
.L3:
	mov	w0, 0
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Arm GNU Toolchain 15.2.Rel1 (Build arm-15.86)) 15.2.1 20251203"
