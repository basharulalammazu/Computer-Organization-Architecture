;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Read an integer from user. Check whether the number is positive or negative. Hints: JMP, JL, JG instructions 
; Sample output 
; Enter a number: 1 
; Positive 
; Enter a number: -1  
; Negative


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------    



.MODEL SMALL
.STACK 100H

.DATA   
    MSG DB "ENTER A NUMBER: $"
    MSG_PS DB "POSITIVE $"
    MSG_NG DB "NEGATIVE $"   
    MEG_INVALID DB "INVALID $"

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX
        
        ; PRINT THE MESSAGE
        MOV AH, 9
        LEA DX, MSG
        INT 21H
        
        
        ; READ 1ST CHARACTER
        MOV AH, 1
        INT 21H
        MOV BH, AL 
    
        ; READ 2ND CHARACTER 
        MOV AH, 1
        INT 21H
        MOV BL, AL                
        
        
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H  
        MOV DL, 0DH
        INT 21H
        
    
    
        CMP BH, 2Dh ; COMPARE 1ST CHARATER BECAUSE FOR THE NEGE 
        JE NG
    
    PS:
        MOV AH, 9
        LEA DX, MSG_PS
        INT 21H
        JMP END
    
    NG:
        MOV AH, 9
        LEA DX, MSG_NG
        INT 21H   
    
    INVALID:
        MOV AH, 9
        LEA DX, MEG_INVALID
        INT 21H
    
    END:
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END
