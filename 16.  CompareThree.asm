.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER THE 1ST NUMBER: $"
    MSG2 DB "ENTER THE 2ND NUMBER: $"
    MSG3 DB "ENTER THE 3RD NUMBER: $"
    
    A DB ?
    B DB ?
    C DB ?
    
    MSGH DB "HIGHEST: $"
    MSGM DB "MIDDLE : $"
    MSGL DB "LOWEST : $"
    
    NEWLINE DB 13, 10, "$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
    
        ; INPUT 1ST NUMBER
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV A, AL
        
        
        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        
        ; INPUT 2ND NUMBER
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV B, AL
        
        
        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        
        ; INPUT 3RD NUMBER
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV C, AL
                   
                   
        ; NEWLINE 
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
                ;=======COMPARE======
        ; A ? B
        MOV BH, A
        MOV BL, B
        CMP BH, BL 
        JG AB_DONE
        ; IF A < B THEN EXCHANGE
        MOV A, BL
        MOV B, BH
        
    AB_DONE:
        ; A ? C
        MOV BH, A
        MOV BL, C
        CMP BH, BL
        JG AC_DONE
        ; IF A < C THEN EXCHANGE
        MOV A, BL
        MOV C, BH
        
    AC_DONE:
        ; B ? C
        MOV BH, B
        MOV BL, C
        CMP BH, BL
        JG BC_DONE
        ; IF B < C THEN EXCHANGE
        MOV B, BL
        MOV C, BH
        
    BC_DONE:

    ; =======OUTPUT=======
        ; HIGHEST
        MOV AH, 9
        LEA DX, MSGH
        INT 21H

        MOV AH, 2
        MOV DL, A
        INT 21H

        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H

        ; MIDDLE
        MOV AH, 9
        LEA DX, MSGM
        INT 21H

        MOV AH, 2
        MOV DL, B
        INT 21H

        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H

        ; LOWEST
        MOV AH, 9
        LEA DX, MSGL
        INT 21H

        MOV AH, 2
        MOV DL, C
        INT 21H
    MAIN ENDP
END