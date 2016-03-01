/*
 * puttime_asm.s
 *
 *  Created on: 5 feb 2015
 *      Author: arvid
 */
 		.global 	puttime			# Makes label puttime globally known
 		.include 	"macros.s"
        .text
        .align 2

puttime:	PUSH 	r31				# Save return address to stack
			PUSH 	r16				# Save whats in r16 to stack to stack

			ldw		r16, 0(r4)		# Load value of r4 to r16, in the format 0x0000nnnn where n is the time printed

			srai 	r4, r16, 20 	# First value of hours
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			srai 	r4, r16, 16 	# Second value of hours
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			movi 	r4, 58			# 58 = 3A. Storing ':'
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			srai 	r4, r16, 12 	# First value of minutes
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			srai 	r4, r16, 8		# Second value of minutes
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			movi 	r4, 58			# 58 = 3A. Storing ':'
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			srai 	r4, r16, 4		# First value of seconds
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			mov 	r4, r16			# Second value of seconds
			call 	hexasc			# Convert to ascii
			mov 	r4, r2
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			movi 	r4, 10 			# Code for new line stored in r4
			PUSH	r4
			call 	putchar			# Print value to console
			POP		r4
			call 	lcdput			# Print value to LCD

			POP 	r16				# Restoring previous r16 value
			POP 	r31				# Restoring return address to r31

			ret						# Returns
