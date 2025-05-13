; Question:
; Write a program that takes a single character input from the user. If the character is a capital English letter (A–Z), print the character. Otherwise, the program should terminate without printing anything.




.MODEL SMALL
.STACK 100H

.DATA
    NEWLINE DB 10, 13, "$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX


    MOV AH, 1
    INT 21H
    MOV BL, AL 


    MOV AH, 9
    LEA DX, NEWLINE
    INT 21H


    CMP BL, 41H
    JL EXIT
    CMP BL, 5AH
    JG EXIT


    MOV AH, 2
    MOV DL, BL
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END 
