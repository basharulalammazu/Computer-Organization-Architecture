.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "Hello World! $ "

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9  ; AH = 9, ONLY FOR STRING OUTPUT 
    LEA DX,MSG1
    INT 21H         
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END