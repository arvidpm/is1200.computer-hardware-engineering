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
			PUSH 	r16				# Spara v�rdet som finns i r16 f�r att returnera tillbaka det i slutet av filen.

			ldw		r16, 0(r4)		# Ladda upp v�rdet i r16 fr�n r4, i formatet 0x0000nnnn d�r n �r tiden som ska skrivas ut.

			srai 	r4, r16, 12 	# F�rsta v�rdet av minuterna
			call 	hexasc			# �ndra det till ascii v�rde.
			mov 	r4, r2			# Flytta v�rdet fr�n hexasc, r2 till r4
			call 	putchar			# Printa ut v�rdet i r4

			srai 	r4, r16, 8		# Andra v�rdet i minuterna
			call 	hexasc			# �ndra det till ascii v�rde
			mov 	r4, r2			# Flytta v�rdet fr�n hexasc, r2 till r4
			call 	putchar			# Printa ut v�rdet i r4

			movi 	r4, 58			# 58 = 3A. Skriver ut ':'.
			call 	putchar			# Printa ut :

			srai 	r4, r16, 4		# F�rsta v�rdet i sekunderna
			call 	hexasc			# �ndra till ascii v�rde
			mov 	r4, r2			# Flytta v�rdet fr�n hexasc, r2 till r4
			call 	putchar			# Printa ut v�rdet i r4

			mov 	r4, r16			# Andra v�rdet i sekunderna
			call 	hexasc			# �ndra till ascii v�rde
			mov 	r4, r2			# Flytta v�rdet fr�n hexasc, r2 till r4
			call 	putchar			# Printa ut v�rdet i r4

			movi 	r4, 10 			# Koden f�r ny rad l�ggs i r4.
			call 	putchar			# Ny rad i f�nstret.

			POP 	r16				# �ndra tillbaka r16 till v�rdet i b�rjan av filen.
			POP 	r31				# Ta fram adressen som puttime_asm.s ska returnera till.

			ret						# Returnera till testputtime d�r puttime anropades
