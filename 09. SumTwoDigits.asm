;---------------------------------------------------
;----------------------QUESTION---------------------
;---------------------------------------------------

; Write an assembly program to a) take two decimal digits from the user, b) display them and their sum on the next line according to the output 
; Sample output: 
; ENTER TWO DECIMAL DIGITS: 3 AND 4 
; THE DIFFERENCE OF 3 AND 4 IS 7 


;---------------------------------------------------
;-----------------------ANSWER----------------------
;---------------------------------------------------






.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB "ENTER TWO DECIMAL DIGIT: $"
    MSG2 DB " AND $"
    MSG3 DB " IS $"
    MSG4 DB "THE DIFFERENCE OF $"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
    
        ; PRINT FIRST MESSAGE
        MOV AH, 9
        LEA DX, MSG1
        INT 21H
    
        ; READ FIRST DECIMAL CHARACTER
        MOV AH, 1
        INT 21H
        MOV BL, AL         
       
    
        ; PRINT SECOND MESSAGE
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
    
        ; READ SECOND DECIMAL CHARACTER
        MOV AH, 1
        INT 21H
        MOV BH, AL         
        
    
        ; NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
    
        ; PRINT MSG4: "THE DIFFERENCE OF "
        MOV AH, 9
        LEA DX, MSG4
        INT 21H
    
        ; PRINT FIRST DECIMAL CHARACTER
        MOV AL, BL
        MOV DL, AL
        MOV AH, 2
        INT 21H
    
        ; PRINT MSG2: " AND "
        MOV AH, 9
        LEA DX, MSG2
        INT 21H
    
        ; PRINT SECOND DIGIT
        MOV AL, BH
        MOV DL, AL
        MOV AH, 2
        INT 21H
    
        ; PRINT MSG3: " IS "
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
    
        ; CALCULATE
        ADD BL, BH  
        SUB BL, 30H
        MOV AL, BL
        MOV DL, AL
        MOV AH, 2
        INT 21H

        ; EXIT
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END
