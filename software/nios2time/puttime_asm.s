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

puttime:	PUSH 	r31				# Spara adressen som puttime_asm.s ska returnera till.
			PUSH 	r16				# Spara värdet som finns i r16 för att returnera tillbaka det i slutet av filen.

			ldw		r16, 0(r4)		# Ladda upp värdet i r16 från r4, i formatet 0x0000nnnn där n är tiden som ska skrivas ut.

			srai 	r4, r16, 12 	# Första värdet av minuterna
			call 	hexasc			# Ändra det till ascii värde.
			mov 	r4, r2			# Flytta värdet från hexasc, r2 till r4
			call 	putchar			# Printa ut värdet i r4

			srai 	r4, r16, 8		# Andra värdet i minuterna
			call 	hexasc			# Ändra det till ascii värde
			mov 	r4, r2			# Flytta värdet från hexasc, r2 till r4
			call 	putchar			# Printa ut värdet i r4

			movi 	r4, 58			# 58 = 3A. Skriver ut ':'.
			call 	putchar			# Printa ut :

			srai 	r4, r16, 4		# Första värdet i sekunderna
			call 	hexasc			# Ändra till ascii värde
			mov 	r4, r2			# Flytta värdet från hexasc, r2 till r4
			call 	putchar			# Printa ut värdet i r4

			mov 	r4, r16			# Andra värdet i sekunderna
			call 	hexasc			# Ändra till ascii värde
			mov 	r4, r2			# Flytta värdet från hexasc, r2 till r4
			call 	putchar			# Printa ut värdet i r4

			movi 	r4, 10 			# Koden för ny rad läggs i r4.
			call 	putchar			# Ny rad i fönstret.

			POP 	r16				# Ändra tillbaka r16 till värdet i början av filen.
			POP 	r31				# Ta fram adressen som puttime_asm.s ska returnera till.

			ret						# Returnera till testputtime där puttime anropades
