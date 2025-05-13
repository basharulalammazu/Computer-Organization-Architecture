; Question:
; Write a program to take a numeric input between 1 and 4 from the user. If the input is odd (1 or 3), print "O"; if the input is even (2 or 4), print "E".






.MODEL SMALL
.STACK 100H

.DATA
    NEWLINE DB 10, 13, "$"
    VO DB "O$"
    VE DB "E$"

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


    CMP BL, 31H
    JE O
    CMP BL, 33H
    JE O

    CMP BL, 32H
    JE E
    CMP BL, 34H
    JE E
    
    JMP EXIT

    O:
        MOV AH,9
        LEA DX, VO
        INT 21H
        JMP EXIT

    E:
        MOV AH, 9
        LEA DX, VE
        INT 21H

    EXIT:
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END
