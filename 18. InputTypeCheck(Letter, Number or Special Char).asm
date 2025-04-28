;
; WRITE AN ASSEMBLY PROGRAM TO READ A CHARACTER FROM THE USER AND DISPLAY WHETHER IT IS A DECIMAL DIGIT, A LETTER, OR A SPECIAL CHARACTER"
; SMAPLE:
; INPUT: A
; OUTPUT: A, IT IS A LETTER
; INPUT: 8
; OUTPUT: 8, IT IS A DIGIT
; INPUT: )
; OUTPUT: ), IT IS A SPECIAL CHARACTHER
; =================================================================================================================================



.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT: $"
    MSG_DIGIT DB ", IT IS A DECIMAL NUMBER $"
    MSG_LET DB ", IT IS A LETTER $"
    MSG_SPE DB ", IT IS A SPECIAL CHARACTER $"
    NEWLINE DB 10, 13, "$" 
.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX
        
        ; INPUT VALUE
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
        
        MOV AH, 1
        INT 21H 
        MOV BL, AL
        
        ; NEWLINE
        MOV AH, 9 
        LEA DX, NEWLINE 
        INT 21H 
        
        ; CHECK THE VALUE
        ; IS NUMBER?
        CMP BL, 30H
        JL SPECIAL_CHAR
        CMP BL, 39H
        JG LETTER_UPPER
         
        ; DECISION: NUMBER
         
        MOV AH, 2
        MOV DL, BL
        INT 21H  
        
        MOV AH, 9 
        LEA DX, MSG_DIGIT
        INT 21H  
        
        JMP EXIT


        LETTER_UPPER:
            CMP BL, 41H 
            JL SPECIAL_CHAR 
            CMP BL, 5AH 
            JG LETTER_LOWER  
            
            ; DECISION: LETTER
            MOV AH, 2
            MOV DL, BL
            INT 21H  
            
            MOV AH, 9 
            LEA DX, MSG_LET
            INT 21H  
            
            JMP EXIT
            
         LETTER_LOWER:
            CMP BL, 61H 
            JL SPECIAL_CHAR 
            CMP BL, 7AH 
            JG SPECIAL_CHAR 
             
            ; DECISION: LETTER
            MOV AH, 2
            MOV DL, BL
            INT 21H  
            
            MOV AH, 9 
            LEA DX, MSG_LET
            INT 21H  
            
            JMP EXIT

        SPECIAL_CHAR:
            ; DECISION: SPECITAL CHAR
            MOV AH, 2
            MOV DL, BL
            INT 21H  
            
            MOV AH, 9 
            LEA DX, MSG_SPE
            INT 21H  
            

        EXIT: 
            MOV AH, 4CH
            INT 21H 
    MAIN ENDP
END
