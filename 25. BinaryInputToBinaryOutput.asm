; Question:
; Write a program that takes a single digit input (0–9) from the user, converts it to binar, and stores the result in a register. (Use SHL, RCR, and loop logic.)



.MODEL SMALL
.STACK 100H

.DATA  
    TXT DB "ENTER BINARY VALUE: $"  
    NEWLINE DB 10, 13, "$"

.CODE
    MAIN PROC   
        MOV AX, @DATA  
        MOV DS, AX                
        
        
        MOV AH, 9
        LEA DX, TXT
        INT 21H
        
        MOV BX,0
         
        
        INPUT:
            MOV AH, 1
            INT 21H
            CMP AL, 13
            JE OUTPUT
            
            SUB AL, 30H
            SHL BX, 1
            OR BL, AL
            LOOP INPUT
        
        
        OUTPUT:  
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            MOV CX, 16
            
        OUTPUT_1:
            SHL BX, 1
            JNC ZERO
            
            MOV AH, 2
            MOV DL,'1'
            INT 21H
            
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


 