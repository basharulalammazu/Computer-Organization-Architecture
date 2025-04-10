;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Read two character and display it new line 
; Sample Output 
; AB 
; AB 

;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------



.MODEL SMALL
.STACK 100H

.DATA
    

.CODE
    MAIN PROC    
        MOV AX, @DATA
        MOV DS, AX 
                        
       
        ;READ 1ST CHARACTER
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
                  
        ; PRINT 1ST CHARACTER
        MOV AH, 2
        MOV DL, BH
        INT 21H
        
        ; PRINT 2ND CHARACTEHER
        MOV AH, 2
        MOV DL, BL
        INT 21H  
    
        ; EXIT
        MOV AH, 4CH
        INT 21H
    
    MAIN ENDP
END
