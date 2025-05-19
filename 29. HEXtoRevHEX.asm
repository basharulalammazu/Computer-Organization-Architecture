.MODEL SMALL
.STACK 100H

.DATA  
    NEWLINE DB 10, 13, "$"

.CODE
    MAIN PROC   
        MOV AX, @DATA  
        MOV DS, AX 
        
        MOV CL, 4             ; HEX ARE 4 BITS 
        MOV BX, 0             
        
    INPUT:
        MOV AH, 1             
        INT 21H
        CMP AL, 13            ; If PRESSED ENTER
        JE OUTPUT
        
        CMP AL, 41H           ; CHECK CHARACTER A-F
        JGE LETTER
        
        SUB AL, 30H           ; CONVERT
        JMP SHIFT
    
    LETTER:
        SUB AL, 37H           ; CONVERT 'A'-'F'
    
    SHIFT:
        SHL BX, CL            ; SHIFT BX LEFT BY 4 BITS
        OR BL, AL             ; SUM AL AND BL AND NEW VALUE STORE IN BL
        JMP INPUT
    
    OUTPUT:  
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H    
        
        
        MOV CX, 4
        MOV AH, 2
    
    FOR:
        MOV DL, BL
        AND DL, 0FH           
                 
        
        CMP DL, 10
        JGE UPPERCHRACTER
    
        ADD DL, 30H          
        INT 21H
        JMP LOOP_
    
    UPPERCHRACTER:
        ADD DL, 37H          
        INT 21H
    
    LOOP_:
        SHR BX, 4            
        LOOP FOR   
    
    MAIN ENDP
END
