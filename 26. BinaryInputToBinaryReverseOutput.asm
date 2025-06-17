; Question:
; Write a program that takes a single digit input (0–9) from the user, converts it to binary, then reverses the binary bits and stores the result in a register. (Use SHR, RCR, and loop logic.)




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
         
        MOV BX, 0  ; TO HOLD THE FINAL INT
        MOV CX, 0
        
        ; SHOW THE INPUT TEXT
        MOV AH, 9
        LEA DX, TXT
        INT 21H
            
        INPUT:
            MOV AH, 1
            INT 21H  
            
            
            CMP AL, 13
            JE OUTPUT
            
            SUB AL, '0'
            SHL BX, 1
            OR BL, AL 
            LOOP INPUT
            
        OUTPUT:
            MOV AH, 9
            LEA DX, NEWLINE
            INT 21H
            
            MOV CX, 16
        
        REVERSE_:
            SHR BX, 1
            JNC PRINT_ZERO
            
            MOV AH, 2
            MOV DL, "1"
            INT 21H   
            
            JMP LOOP_
            
            
        PRINT_ZERO:
            MOV AH, 2
            MOV DL, "0"
            INT 21H
        
        LOOP_:
            LOOP REVERSE_
            
        
        PRINT_:
    MAIN ENDP
END
