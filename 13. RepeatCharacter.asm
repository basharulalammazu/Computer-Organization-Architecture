;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Read a character and display it 50 times on the next line. Hints: use DEC and JNZ instructions and 
; Sample Output 
; Enter a character: d 
; dddddddddddddddddddddddddddddddddddddddddddddddddd

; Thank you. 


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------



.MODEL SMALL
.STACK 100H

.DATA
   MSG DB "ENTER A CHARACTER: $"
   MSG2 DB 10, 13, 10, 13, 10, 13, "THANK YOU. $" 

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX 
                        
        MOV CH, 1          ; COUNTER INITIALIZE
    
        ; PRINT MESSAGE
        MOV AH, 9
        LEA DX, MSG
        INT 21H
    
        ; READ CHARACTER
        MOV AH, 1
        INT 21H
        MOV BH, AL
         
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H          
    
    LOOP50:        
        MOV AH, 2
        MOV DL, BH          
        INT 21H  
        
        INC CH              ; INCREMENT COUNTER
        CMP CH, 51
        JL LOOP50           ; REPEAR LOOP IF CH < 50
    
        ; PRINT THANK YOU MESSAGE
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
    
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END
