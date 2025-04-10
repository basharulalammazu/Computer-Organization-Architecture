;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Write an assembly program that a) takes three lowercase letters from the user, b) print them in uppercase letters. 
; Sample output: 
; ENTER THREE LETTERS IN UPPERCASE: def 
; THE OUTPUTS IN LOWERCASE ARE: DEF


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------


.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER THREE LETTERS IN LOWERCASE: $"
    MSG2 DB "THE OUTPUTS IN UPPERCASE ARE: $"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ; PRINT 1ST MESSAGE
        MOV AH, 9
        LEA DX, MSG1
        INT 21H     
                    
        ; READ 1ST CHARACTER            
        MOV AH, 1
        INT 21H
        MOV BL, AL
                            
        ; READ 2ND CHARACTER                    
        MOV AH, 1
        INT 21H
        MOV BH, AL
                            
        ; READ 3RD CHARACTER                    
        MOV AH, 1
        INT 21H
        MOV CL, AL          
                       
        ; PRINT NEWLINE               
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
                
        ; RESULT        
        ; PRINT RESUKT MESSAGE
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
        
        ; CONVERTING FROM LOWERCASE TO UPPERCASE
        SUB BL, 20H
        SUB BH, 20H
        SUB CL, 20H                
        
        
        ; PRINT 1ST CONVERTED CHARACTER
        MOV AL, BL  
        MOV DL, AL
        MOV AH, 2
        INT 21H
        
        
        ; PRINT 2ND CONVERTED CHARACTER
        MOV AL, BH
        MOV DL, AL
        MOV AH, 2
        INT 21H
        
        ; PRINT 3RD CONVERTED CHARACTER
        MOV AL, CL
        MOV DL, AL
        MOV AH, 2
        INT 21H
        
        ; EXIT   
        MOV AH, 4CH
        INT 21H
   MAIN ENDP
END