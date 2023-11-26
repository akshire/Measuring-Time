.equ RAM, 0x1000
.equ LEDs, 0x2000
.equ TIMER, 0x2020
.equ BUTTON, 0x2030

start:
br main
; see if the slots are in the corresponding slots

interrupt_handler:
	addi sp, sp, -16 ; save to stack
	stw t0, 0(sp)
	stw s0, 4(sp)
	stw s1, 8(sp)
	stw ra, 12(sp)
	rdctl s0, ipending ; read ipending
	add s1, zero, zero ; index in the isr array
	ihandler_loop:
		andi t0, s0, 1 ; mask on the next irq bit
		beq t0, zero, ihandler_continue
		ldw t0, isr_array(s1) ; load the corresponding routine address
		callr t0 ; call the rountine
	ihandler_continue:
		srli s0, s0, 1 ; shift the ipending vector
		addi s1, s1, 4 ; point to the next routine address
		bne s0, zero, ihandler_loop
	ihandler_return:
		ldw t0, 0(sp) ; restore from stack
		ldw s0, 4(sp)
		ldw s1, 8(sp)
		ldw ra, 12(sp)
		addi sp, sp, 16
		addi ea, ea, -4 ; correction of the ea register
		eret

isr_array:
	.word timer_isr
	.word 0
	.word buttons_isr

timer_isr:
	stw zero, TIMER(zero) ; acknowledge interrupt
	ldw t0, LEDs+4(zero)
	addi t0, t0, 1 ; increment counter2
	stw t0, LEDs+4(zero)
	ret

buttons_isr:
	ldw t1, LEDs(zero)
	ldw t0, BUTTON+4(zero)
	andi t0, t0, 1
	sub t1, t1, t0 ; increment counter for button 1
	ldw t0, BUTTON+4(zero)
	srli t0, t0, 1
	andi t0, t0, 1
	add t1, t1, t0 ; decrement counter for button 2
	stw t1, LEDs(zero)
	stw zero, BUTTON+4(zero) ; acknowledge interrupt
	ret

main:
	addi sp, zero, RAM+0x1000 ; init the sp
	addi t0, zero, 5
	wrctl ienable, t0 ; enable timer + button irq
	addi t0, zero, 1
	wrctl status, t0 ; enable interrupts
	addi t0, zero, 999 ; set the period of the timer to 1000 cycles
	stw t0, TIMER+4(zero)
	addi t0, zero, 11 ; start the timer:
	stw t0, TIMER+8(zero) ; start + cont + ito
	add t0, zero, zero ; init counter1

	main_loop:
		
		stw t0, LEDs+8(zero) ; display counter1
		addi t0, t0, 1 ; increment counter1
		br main_loop
