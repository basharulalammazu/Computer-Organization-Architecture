; Question
; Write a program that prints all 256 ASCII characters (from 0 to 255) using a loop. Use BL register as a counter.


.MODEL SMALL
.STACK 100H

.DATA

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV BL, 0
    
        PRINT_LOOP:
            MOV DL, BL
            MOV AH, 2
            INT 21H
        
            INC BL
            CMP BL, 0
            JNZ PRINT_LOOP
        
        
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
END 
