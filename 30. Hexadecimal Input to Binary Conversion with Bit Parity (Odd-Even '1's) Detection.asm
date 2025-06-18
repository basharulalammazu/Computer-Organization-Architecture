;QUESTION:  TAKE HEX INPUT & PRINT THE BINARY OF THE HEX VALUE THEN COUNT HOW MANY ONE'S & ZERO'S ARE IN THE ANSWER. IF THERE ARE EVEN ONE'S THEN PRINT EVEN, OTHERWISE ODD


.MODEL SMALL
.STACK 100H

.DATA  
    MSG1 DB "ENTER HEXA VALUE: $"
    NEWLINE DB 13, 10, "$"
    EVEN_MSG DB "EVEN$", 13, 10, "$"
    ODD_MSG  DB "ODD$", 13, 10, "$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
       
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV BX, 0
        MOV CL, 4
        
        INPUT:
            MOV AH, 1
            INT 21H
            
            
            CMP AL, 13
            JE OUTPUT
            
            ; HERE COMPARE INPUT IS DIGIT OR LETER
            CMP AL, 'A'
            JL DIGIT     ; IF DIGIT
            
            SUB AL, 37H  ; 
            JMP STORE
       
        DIGIT:
            SUB AL, 30H
        
        STORE:
            SHL BX, 4     
            OR BL, AL
            JMP INPUT
            
            
        OUTPUT:
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            
            MOV CX, 16    ; 16 BIT BECAUSE HEX IS 16
            MOV SI, 0
        
        COUNT_ONE:
            SHL BX, 1
            JNC NEXT_BIT  ; IF CF = 0 THEN NOT COUNT
            INC SI        ; INCRIMENT COUNT
        
        NEXT_BIT:
            LOOP COUNT_ONE
            
            TEST SI, 1    ; CHECK LAST BIT 
            JZ EVEN       ; IF LAST BIT ZERO THEN PRINT EVEN
            
            MOV AH, 9
            LEA DX, ODD_MSG
            INT 21H
            JMP END_PROGRAM
            
        EVEN:
            MOV AH, 9
            LEA DX, EVEN_MSG
            INT 21H
            
        
            
            
        END_PROGRAM:
            MOV AH, 4CH
            INT 21H
    
    MAIN ENDP
END
