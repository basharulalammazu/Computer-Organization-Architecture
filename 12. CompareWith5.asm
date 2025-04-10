;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Suppose that CL contains the value of 5. Take an integer from user. Compare the value with 
; CL. And show whether the user input is less than, greater than and equal to CL. Hints: use CMP, 
; JL, JG, JE 
; Sample output 
; Enter a number: 1 
; Less than 5 
; Enter a number: 7  
; Greater than 5 
; Enter a number: 5 
; Equal to 5


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------



.MODEL SMALL
.STACK 100H

.DATA         
   MSG DB "ENTER A NUMBER: $" 
   MSG_INVALID DB "INVALID INPUT$"   
   MSG_LESS DB "LESS THAN 5$"
   MSG_GREATER DB "GREATER THAN 5$"  
   MSG_EQUAL DB "EQUAL TO 5$"

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX 
        
        MOV CL, 35H
                   
        ; PRINT MESSAGE
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        
        ; READ THE VALUE
        MOV AH, 1
        INT 21H
        MOV BH, AL 
    
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
    
        CMP BH, 30H ; COMPARE 1ST CHARATER BECAUSE FOR THE NEGE   
        JL INVALID
        CMP BH, 39H
        JG INVALID
        
    
        COM:
            CMP BH, CL
            JL LESS
            JG GREATER
            JE EQUAL
            
        LESS:
            MOV AH, 9
            LEA DX, MSG_LESS
            INT 21H
            JMP END 
            
        GREATER:
            MOV AH, 9
            LEA DX, MSG_GREATER
            INT 21H
            JMP END
                      
        EQUAL:
            MOV AH, 9
            LEA DX, MSG_EQUAL
            INT 21H
            JMP END      
        
        INVALID:
            MOV AH, 9
            LEA DX, MSG_INVALID
            INT 21H
        
        END:
            MOV AH, 4CH
            INT 21H
    
    MAIN ENDP
END
