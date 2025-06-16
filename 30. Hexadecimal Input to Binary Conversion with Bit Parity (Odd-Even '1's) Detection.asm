; TAKE HEX INPUT & PRINT THE BINARY OF THE HEX VALUE THEN COUNT HOW MANY ONE'S & ZERO'S ARE IN THE ANSWER. IF THERE ARE EVEN ONE'S THEN PRINT EVEN, OTHERWISE ODD


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
        
        ; SHOW MESSAGE
        MOV AH, 9
        LEA DX, MSG1
        INT 21H

        MOV BX, 0 
        MOV CL, 4

        READ_HEX:
            MOV AH, 1
            INT 21H        ; READ 
            CMP AL, 13     ; CHECK THE ENETER KEY
            JE BINARY
    
            CMP AL, 'A'
            JL IS_DIGIT ; CHECK  ITS LESS THAN 37
            SUB AL, 37H    ; For A-F ()
            JMP STORE
    
        IS_DIGIT:
            AND AL, 0FH    ; CONVERT INTO ASKII
    
        STORE:
            SHL BX, CL     ; SHIFT LEFT
            OR BL, AL      ; ADD THE HEX DIGIT
            JMP READ_HEX
    
        BINARY:
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
    
            ; COUNT NUMBER OF 1'S
            MOV CX, 16     ; 16 BIT BECAUSE HEX IS 16
            MOV SI, 0     ; Clear SI
    
        COUNT_ONES:
            SHL BX, 1
            JNC NEXT_BIT
            INC SI        ; INCREMENT COUNT IF CARRY SET (1 BIT)
    
        NEXT_BIT:
            LOOP COUNT_ONES
            TEST SI, 1     ; CHECK LAST BIT
            JZ EVEN
    
            ; IF ODD
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
