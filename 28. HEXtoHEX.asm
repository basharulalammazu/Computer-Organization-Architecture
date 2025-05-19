.MODEL SMALL       ; Define memory model
.STACK 100H        ; Allocate stack space

.DATA  
    TXT DB "ENTER BINARY VALUE: $"     ; Message to prompt user input
    NEWLINE DB 10, 13, "$"             ; Newline characters for formatting

.CODE
    MAIN PROC   
        ; Initialize Data Segment
        MOV AX, @DATA  
        MOV DS, AX 
        
        MOV CL, 4          ; CL = 4, used for bit-shifting (each hex digit = 4 bits)
        MOV BX, 0          ; BX will store the final hexadecimal value, clear it first
        
    INPUT:                 ; Input loop begins
        MOV AH, 1          ; Function 1: Read a character from standard input
        INT 21H            ; DOS interrupt to read character
        CMP AL, 13         ; Check if Enter (carriage return) is pressed
        JE OUTPUT          ; If Enter is pressed, jump to OUTPUT

        ; Check if input is a letter (A-F or a-f)
        CMP AL, 41H        ; Compare with ASCII 'A'
        JGE LETTER         ; If input is A-F, go to LETTER

        ; Else it's a digit (0-9)
        SUB AL, 30H        ; Convert ASCII number to integer (e.g., '0' → 0, '9' → 9)
        JMP SHIFT          ; Jump to shift operation

    LETTER:
        SUB AL, 37H        ; Convert ASCII 'A'-'F' to values 10-15
                           ; 'A' (41H) - 37H = 0AH = 10
        
    SHIFT:
        SHL BX, CL         ; Shift BX left by 4 bits to make space for new digit
        OR BL, AL          ; Add new value (AL) to BX using OR
        JMP INPUT          ; Repeat input loop

    OUTPUT:  
        ; Print newline for formatting
        MOV AH, 9
        LEA DX, NEWLINE
        INT 21H    
        
        MOV CX, 4          ; Set up loop to print 4 hex digits
        MOV AH, 2          ; DOS function 2: Display character
        
    FOR:
        MOV DL, BH         ; Copy high byte of BX to DL
        SHR DL, 4          ; Get the leftmost 4 bits (highest nibble)
        ROL BX, 4          ; Rotate BX left by 4 bits to move next nibble into place
        
        CMP DL, 10         ; If DL >= 10, it is a letter A-F
        JGE UPPERLETTER

        ADD DL, 30H        ; Convert value 0–9 to ASCII ('0'-'9')
        INT 21H            ; Display character
        JMP LOOP_          ; Continue loop

    UPPERLETTER:
        ADD DL, 37H        ; Convert value 10–15 to ASCII ('A'-'F')
        INT 21H            ; Display character
        JMP LOOP_          ; Continue loop

    LOOP_:  
        LOOP FOR           ; Loop until CX = 0 (4 times total)
            
    MAIN ENDP
END
