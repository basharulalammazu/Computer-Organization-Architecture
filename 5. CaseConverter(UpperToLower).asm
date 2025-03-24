.MODEL SMALL
.STACK 100H

.DATA
    MSG DB "ENTER THE LETTER: $"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ; PRINT the MSG
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        ; INPUT THE VALUE
        MOV AH, 1
        INT 21H
        MOV BH, AL
        
        ; PRINT NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ; Convert uppercase letter to lowercase
        ; ASCII difference between uppercase and lowercase letters is 20H
        ADD BH, 20H     ; Add 20H to the ASCII value in BH to convert uppercase to lowercase

        ; Display the converted character
        MOV DL, BH      ; Move the converted character from BH to DL (as DL is used for printing)
        INT 21H         ; Interrupt call to print the character in DL    
        
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END
