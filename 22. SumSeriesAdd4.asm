; Question:
; Write a program that calculates the sum of the following arithmetic series for 5 terms:
; 1 + 5 + 9 + 13 + 17
; Store the result in a variable and terminate the program.





.MODEL SMALL
.STACK 100H

.DATA
    A DW ?
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AX, 0
        MOV BX, 1
        MOV CX, 5   ; IF USE LOOP AND ALSO VALUE STORE IN CX THEN LOOP AUTOMATICALLY DECRIES THE CX
       
        SUMM:
           ADD AX, BX
           ADD BX, 4
           
           MOV A, AX 
           LOOP SUMM
        
        
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
END 
