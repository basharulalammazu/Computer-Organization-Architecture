.MODEL SMALL
.STACK 100H

.DATA
    MSG DB "ENTER THE LOWER LETTER: $"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        ; INPUT
        MOV AH, 1
        INT 21H
        MOV BH, AL
        
        ; PRINT NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ; Convert lowercase letter to uppercase
        ; The ASCII difference between lowercase and uppercase letters is 32d (20H in hex)
        SUB BH, 32D     ; Subtract 32 from the ASCII value in BH to convert lowercase to uppercase

        ; Display the converted character
        MOV DL, BH       ; Move the converted character from BH to DL (as DL is used for printing)
        INT 21H          ; Interrupt call to print the character in DL

        ; EXIT PROGRAM
        MOV AH, 4CH   
        INT 21H 
    MAIN ENDP
END
