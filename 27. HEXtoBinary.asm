.MODEL SMALL
.STACK 100H

.DATA  
    TXT DB "ENTER BINARY VALUE: $"  
    NEWLINE DB 10, 13, "$"

.CODE
    MAIN PROC   
        MOV AX, @DATA  
        MOV DS, AX 
        
        MOV CL, 4
        MOV BX, 0 ; CLEAR THE BX REGISTER 
        
        INPUT:
            MOV AH, 1
            INT 21H
            CMP AL, 13
            JE OUTPUT
            
            ; CHECK LETTER (A-F)
            CMP AL, 41H
            JGE LETTER
            
            ; IF LETTER CONDITION DOESN'T MATCH THEN THAT IS MUST BE NUMBER(0-9) 
            SUB AL, 30H
            JMP SHIFT
            
        LETTER:
            SUB AL, 37H ; HERE 'A'-37H = 10, THAT IS THE VALUE OF A
          
        
        SHIFT:
            SHL BX, CL ; ADD 0000 FOR THE NEXT ITERATION
            OR BL, AL  ; THEN ADD VALUE OF AL AND BL
            JMP INPUT
            
        OUTPUT:  
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            MOV CX, 16
            
        OUTPUT_1:
            SHL BX, 1 ; HERE DEVIDED BY 10 AND CHECK DIVISOR WHICH IS CARRY 
            JNC ZERO  ; IF CARRY IS NOT 1 THEN REDIRECT TO ZERO LABEL
            
            ; IF DEVISOR IS NOT ZERO (1) AND THEN PRINT 1 
            MOV AH, 2
            MOV DL,'1'
            INT 21H
            
            ; THEN REDIRECT FOR THE LOOP_ LEBEL
            JMP LOOP_
            
        ZERO:  
            MOV AH, 2
            MOV DL, '0'
            INT 21H  
            JMP LOOP_ 
        LOOP_:  
            LOOP OUTPUT_1
            
            
    MAIN ENDP
END