/*
 * delay_asm.s
 *
 *  Created on: 10 feb 2015
 *      Author: arvid
 */
 		.global 	delay			# Makes label delay globally known
        .text
        .align 2
        .equ		delaycount,     6350

delay:	mov		r2, r4 				# Skriver r4 till r2, för att lämna r4 intakt
		muli	r2,r2, delaycount	# Multiplicera med konstant delaycount

inner:	subi	r2, r2, 1			# Minska räknare med 1
		bgt		r2, r0, inner		# Hoppa till inner om r2 >= 0

		.end
