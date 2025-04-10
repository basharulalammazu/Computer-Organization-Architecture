;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Write a program to (a) read three characters (c) display them down the left margin in reverse order. 
; Sample Output:  
; ENTER THREE INITIALS: JFK 
; K 
; F 
; J 






;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------



.MODEL SMALL
.STACK 100H   
.DATA  
    MSG DB "ENTER THREE INITIALS: $"
    
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
        
        ; PRINT LAST CHARACTER 
        MOV AH, 2
        LEA DL, CL
        INT 21H   
        
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ; PRINT 2ND CHARACTER
        MOV AH, 2
        LEA DL, BH 
        INT 21H
        
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        ; PRINT 1ST CHARACTER
        MOV AH, 2
        MOV DL, BL
        INT 21H
        
        ; EXIT
        MOV AH, 4CH
        INT 21H
   MAIN ENDP
 END
        
