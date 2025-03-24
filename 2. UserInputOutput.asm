.MODEL SMALL
.STACK 100H

.DATA
MSG DB "Enter the value: $ "

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
            
        MOV AH, 9      ; AH = 9, Only for STRING output
        LEA DX, MSG
        INT 21H  
        
        MOV AH, 1      ; AH = 1, For Single Value Input, Single Value input is 8 bits
        INT 21H
        MOV BH,AL    
        
        ; PRINT NEW LINE
        MOV AH, 2      ; AH = 2, DOS function to print a single character
        MOV DL, 0AH    ; ASCII for Line Feed (LF)
        INT 21H        ; Call DOS interrupt to print LF
        MOV DL, 0DH    ; ASCII for Carriage Return (CR)
        INT 21H        ; Call DOS interrupt to print CR
        
        MOV AH,2       ; AH = 2, For Single Value Output, Single Value Output is 8 bits 
        MOV DL,BH
        INT 21H    
        
        ; EXIT PROGRAM
        MOV AH, 4CH   
        INT 21H 
    MAIN ENDP
END