;Drugi projektni zadatak, sortinje niza u ratucem poretku.
;Registri su 16-bitni.
;Duzina reci je 1 bajt. 
;Koriscen je emu8086 emulator.

org 100h                ;Pomeraj od 100h(256d) bajta za pocetak programa
.data
array: db 9,10,2,7,6,5,4,1,3,1
.code 

mov si, 0      		    ;Postavljanje SI registra kao pokazivac za niz
mov cl,10          	    ;Postavljanje u CL registar broj prolaza kroz niz 
dec cl			        ;broj clanova niza minus 1,  N-1 

loop_sort:              ;Petlja za sortiranje
mov si, 0       	    ;Inicijalizacija pokazivaca  
mov ch, 10             	;Postavljanje u CH kao broj poredjenja u jednom prolazu
dec ch			        ;broj clanova niza minus 1,  N-1


loop_swap:		        ;Petlja za zamenu mesta  
mov al, array[si]       ;Dodati element niza na kome je pokazivac u AL registar
inc si                  ;Pomeramo pokazivac za 1, na sledeci element niza
cmp al, array[si]       ;Uporedi AL sa sledecim elementom niza u memoriji
jc manji_je            	;Ako je AL manji od memorije idemo na manji_je
xchg al, array[si]      ;Ako je AL veca od memorije promeniti sadrzaj memorije 
xchg al, array[si-1]    ;na koji ukazuje SI i predhodna memorijska lokacija

manji_je:
dec ch       	        ;Smanjiti broj za poredjenje za 1
jnz loop_swap           ;Ponavljanje poredjenja sve dok CH brojac ne bude nula
dec cl                  ;Smanjenje broja za ponavljanje
jnz loop_sort           ;Prolazimo kroz niz sve dok CL ne bude nula
hlt                     ;Zaustavljanje izvrsavanja programa 
           
