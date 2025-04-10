;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

;  Write a program to check password using Assembly Programming. Suppose the password is mypassword 
; Sample output 
; Enter your password: 123
; Password Matched 
; Enter your password: 235 
; Password Not Matched


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------



.MODEL SMALL
.STACK 100H

.DATA
     MSG DB "ENTER YOUR PASSWORD: $"
     RIGHT DB 10, 13, "PASSWORD MATCHED$"
     WRONG DB 10, 13, "PASSWORD NOT MATCH$"

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX 
                        
        
        ;PRINT MESSAGE
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        ;READ 1ST CHARACTER
        MOV AH, 1
        INT 21H
        MOV BH, AL
                  
                  
        ; READ 2ND CHARACTER
        MOV AH, 1                               
        INT 21H
        MOV BL, AL                                             
        
                   
        ; READ 3RD CHARACTER
        MOV AH, 1
        INT 21H
        MOV CL, AL
                  
        ; CHECK 1ST CHAR
        CMP BH, 31H
        JNE WRONG_PASS
        
        ; CHECK 2ND CHAR
        CMP BL, 32H
        JNE WRONG_PASS
        
        ; CHECK 3RD CHAR
        CMP CL, 33H
        JNE WRONG_PASS;
        JE RIGHT_PASS;
        
        
        RIGHT_PASS:
            MOV AH, 9
            LEA DX, RIGHT
            INT 21H  
            JMP END
            
        
        WRONG_PASS:
            MOV AH, 9
            LEA DX, WRONG
            INT 21H
            JMP END
        
    
        ; Exit  
        END:
            MOV AH, 4CH
            INT 21H
    
    
    MAIN ENDP
END
