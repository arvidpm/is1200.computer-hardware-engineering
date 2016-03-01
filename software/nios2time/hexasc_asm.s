/*
 * hexasc_asm.s
 *
 *  Created on: 22 jan 2015
 *      Author: arvid
 */
		.global hexasc			# Makes label hexasc globally known
        .text
        .align 2

hexasc: movi 	r10, 0x09		# Stores hexadecimal value 09 (0000I00I) to r10
        andi 	r4, r4, 0x0f	# Mask r4 with 4 bits
        bgt 	r4, r10, L1  	# Compare if r4 > r10 and if so, jumps to J1
        movi 	r2, 0x30		# Stores hexadecimal value 30 (00II0000) to r2
        add 	r2, r2, r4		# Adds hexadecimal value 30 to value of r4 and stores in r2
        andi 	r2, r2, 0xff	# Mask r2 with 8 bits
        ret

L1:     movi 	r2, 0x37		# Stores hexadecimal value 37 (00II0III) to r2
        add 	r2, r2, r4		# Adds hexadecimal value 37 to value of r4 and stores in r2
        andi 	r2, r2, 0xff	# Mask r2 with 8 bits
        ret
