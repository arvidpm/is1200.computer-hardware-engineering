/*
 * delay_asm.s
 *
 *  Created on: 10 feb 2015
 *      Author: arvid
 */
 		.global 	delay			# Makes label "delay" globally known
        .text
        .align 2
        .equ	delaycount, 8500	# Adjusts delay

delay:	mov		r2, r4 				# Writes r4 to r2, keeping r4 intact
		muli	r2,r2, delaycount	# Multiply with variable "delaycount"

inner:	subi	r2, r2, 1			# Lower counter by 1
		bgt		r2, r0, inner		# Jump to label "inner" if r2 >= 0

		.end
