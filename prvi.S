#   Projekat 2023, prvi zadatak
#   Reci duzine 4 bajta
#   Prvi projektni zadatak, zamena min i max u kvadratnoj matrici.
#   Registri su 32-bitni.
#   Duzina reci 4 bajta. 
#   Koriscen je Ripes simulator.

.data
class_marks:			        # Upis matrice u asemblerski kod
    .word 3,2,1
    .word 6,4,5
    .word 9,8,7
    
    class_marks_size:.word 9 	# Broj elemenata matrice 
    col:.word 3           	    # Broj kolona
    row:.word 3		            # Broj redova
  
.text
main:
    la x12, class_marks	        # Upis bazne adrese matrice(adresa prvog clana) u reg. x12
    lw x13, class_marks_size    # Upis broja clanova matrice u reg. x13
    lw  x7, 0(x12)		        # U reg. x7 smestamo trenutni maksimalni clan 	
    lw  x6, 0(x12)		        # U reg. x6 smestamo trenutni minimalni clan 	
			                    # Pocetno stanje za x6 i x7 je prvi clan

loop_minmax:			        # Petlja za pronalazenja min i max
    beq x13, x0 zamena	        # Ako x13=x0 (x13=0), i prelazo na zamena
    lw  x5, 0(x12)		        # Dovodimo trenutni clan za poredjenje u x5
    bgt x5, x6, nije_manji	    # Ako x5 > ili = od x6 ne menjamo trenutni min, idemo na nije_manji  
    add x6, x5, x0		        # Ako je manji upisujemo njegovu vrenost u x6 (menjamo trenutni min)
    add x30,x12, x0		        # a njegovu adresu u x30
  
nije_manji:
   blt x5, x7, nije_veci	    # Ako x5 < ili= od x7 ne menjamo trenutni max, idemo na nije_veci 
   add x7, x5, x0		        # Ako je veci upisujemo njegovu vrenost u x7 (menjamo trenutni max)
   add x31, x12, x0	            # a njegovu adresu u x31				
  
nije_veci:
   addi x13, x13, -1	        # Smanjemo duzinu niza za poredjenje za 1
   addi x12, x12, 4	            # Prelazimo na sledeci clan tako sto povecavamo adresu za 4 (rec 4 bajta)
   j loop_minmax	            # Vracamo se na pocetak petlje loop_minmax:

zamena:		                    # Zamena min i max 
  sw x7, 0(x30)		            # Na mem. adresu od min upisujemo vrednost max
  sw x6, 0(x31)		            # Na mem. adresu od max upisujemo vrednost min
