; Question:
; Write a program that takes a single digit input (0–9) from the user, converts it to binary, then reverses the binary bits and stores the result in a register. (Use SHL, RCR, and loop logic.)



.MODEL SMALL
.STACK 100H

.DATA

.CODE
    MAIN PROC   
        MOV AX, @DATA  
        MOV DS, AX
        
        
        MOV AH,1
        INT 21H
        SUB AL, 30H  
        
        
        MOV CH, 1
          
        REVERSE:
            SHL AL, 1
            RCR BL, 1
            LOOP REVERSE
            MOV AL, BL  
            
    MAIN ENDP
END



 