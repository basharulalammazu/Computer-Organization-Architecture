.MODEL SMALL      
.STACK 100H     

.DATA
    A DB ?        ; Reserve 1 byte for variable A
    B DB ?        ; Reserve 1 byte for variable B

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX     

        ; INPUT FIRST CHARACTER
        MOV AH, 1      ; Function 1: Input a single character
        INT 21H        ; Call DOS interrupt
        MOV A, AL      ; Store input character in variable A
        
        ; INPUT SECOND CHARACTER
        MOV AH, 1      ; Function 1: Input another single character
        INT 21H        ; Call DOS interrupt
        MOV B, AL      ; Store input character in variable B
        
        ; EXIT PROGRAM
        MOV AH, 4CH    ; Function 4CH: Exit program
        INT 21H        ; Call DOS interrupt
    MAIN ENDP
END