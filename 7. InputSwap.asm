.MODEL SMALL      
.STACK 100H        

.DATA
    A DB ?               ; Reserve 1 byte for variable A
    B DB ?               ; Reserve 1 byte for variable B

.CODE
    MAIN PROC
        MOV AX, @DATA 
        MOV DS, AX       

        ; INPUT FIRST CHARACTER
        MOV AH, 1        
        INT 21H        
        MOV A, AL      

        ; INPUT SECOND CHARACTER
        MOV AH, 1       
        INT 21H          
        MOV B, AL          

        ; SWAP THE VALUES OF A AND B
        MOV BL, A      ; Load A into BL
        XCHG BL, B     ; SWAP     
        MOV A, BL      ; Store B into A
        

        ; PRINT NEW LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H

        ; PRINT SWAPPED VALUES
        MOV AH, 2        ; DOS function to print a single character
        MOV DL, [A]      ; Load swapped value of A
        INT 21H          ; Print character

        MOV AH, 2        ; DOS function to print a single character
        MOV DL, [B]      ; Load swapped value of B
        INT 21H          ; Print character

        ; EXIT PROGRAM
        MOV AH, 4CH      
        INT 21H          
    MAIN ENDP
END
