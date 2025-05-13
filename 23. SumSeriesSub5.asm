; Question:
; Write a program that calculates the sum of a series where:
; Start from 100, and subtract 5 for each next term for a total of 20 terms.
; Example: 100 + 95 + 90 + ...
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
        MOV BX, 100
        MOV CX, 20   ; IF USE LOOP AND ALSO VALUE STORE IN CX THEN LOOP AUTOMATICALLY DECRIES THE CX
       
        SUBB:
           ADD AX, BX
           SUB BX, 5
           
           MOV A, AX 
           LOOP SUBB
        
        
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
END 
