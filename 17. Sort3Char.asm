.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER THE 1ST CHAR: $"
    MSG2 DB "ENTER THE 2ND CHAR: $"
    MSG3 DB "ENTER THE 3RD CHAR: $"
    
    NEWLINE DB 10, 13, "$" 
    
    MSGH DB "1ST CHAR: $"
    MSGM DB "2ND CHAR: $"
    MSGL DB "3RD CHAR: $"
    
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ; INPUT 1ST CHAR
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV AH, 1 
        INT 21H
        MOV BH, AL
        
        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        
        ; INPUT 2D CHAR
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        
        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        
        ; INPUT 3RD CHAR
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV CH, AL
        
        
        ; NEWLINE
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H
        
        ; USER INPUT: BH = 1ST CHAR, BL = 2ND CHAR, CH = 3RD CHAR
        ;===================
        ;     COMPARE
        ;===================
        
        
        ; BH ? BL
        CMP BH, BL
        JG BH_BL_DONE
        XCHG BH, BL
        
        BH_BL_DONE:
            ; BH ? CH
            CMP BH, CH
            JG BH_CH_DONE
            XCHG BH, CH
            
        BH_CH_DONE:
            ; BL ? CH
            CMP BL, CH
            JG PRINT_OUTPUT
            XCHG BL, CH
        
        PRINT_OUTPUT:
            ; NOW, BH = 1ST, BL = 2ND, CH = 3RD
            ; PRINT 1ST CHAR
            MOV AH, 9
            LEA DX, MSGH 
            INT 21H
            
            MOV AH, 2
            MOV DL, BH
            INT 21H
            
            ; NEWLINE
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            
            
            ; 2ND CHAR
            MOV AH, 9
            LEA DX, MSGM
            INT 21H
            
            MOV AH, 2
            MOV DL, BL
            INT 21H
            
            ; NEWLINE
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            
            
            ; 3RD CHAR
            MOV AH, 9
            LEA DX, MSGL
            INT 21H
            
            MOV AH, 2
            MOV DL, CH
            INT 21H  
            
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
END                           