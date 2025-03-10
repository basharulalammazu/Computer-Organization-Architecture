.MODEL SMALL    ; Define the memory model as SMALL (Code and Data in separate segments)
.STACK 100H     ; Allocate 256 bytes (100H) of stack space

.DATA
MSG1 DB "ENTER 1ST VALUE: $ "  ; Message for first value input
MSG2 DB "ENTER 2ND VALUE: $ "  ; Message for second value input


.CODE
MAIN PROC
    MOV AX, @DATA  ; Load the address of the data segment into AX
    MOV DS, AX     ; Move AX (data segment address) into DS to access variables
     
    ; PRINT MSG1
    MOV AH, 9      ; AH = 9, DOS function to only print a string
    LEA DX, MSG1   ; Load the effective address of MSG1 into DX
    INT 21H        ; Call DOS interrupt to display MSG1
                    
    ; INPUT FIRST VALUE     
    MOV AH, 1      ; AH = 1, DOS function for single-character input
    INT 21H        ; Call DOS interrupt to take a single character input
    MOV BH, AL     ; Store the input character in BH
                    
    ; PRINT NEW LINE
    MOV AH, 2      ; AH = 2, DOS function to print a single character
    MOV DL, 0AH    ; ASCII for Line Feed (LF)
    INT 21H        ; Call DOS interrupt to print LF
    MOV DL, 0DH    ; ASCII for Carriage Return (CR)
    INT 21H        ; Call DOS interrupt to print CR
                    
    ; PRINT FIRST INPUT CHARACTER                
    MOV AH, 2      ; AH = 2, DOS function to print a single character  
    MOV DL, BH     ; Load the first input character (stored in BH) into DL
    INT 21H        ; Call DOS interrupt to display character
                        
    ; PRINT NEW LINE
    MOV AH, 2      ; AH = 2, DOS function to print a single character
    MOV DL, 0AH    ; ASCII for Line Feed (LF)
    INT 21H        ; Call DOS interrupt to print LF
    MOV DL, 0DH    ; ASCII for Carriage Return (CR)
    INT 21H        ; Call DOS interrupt to print CR
    
    ; PRINT MSG2  
    MOV AH, 9      ; AH = 9, DOS function to print a string
    LEA DX, MSG2   ; Load the effective address of MSG2 into DX
    INT 21H        ; Call DOS interrupt to display MSG2
          
    ; INPUT SECOND VALUE      
    MOV AH, 1      ; AH = 1, DOS function for single-character input
    INT 21H        ; Call DOS interrupt to take a single character input
    MOV BL, AL     ; Store the second input character in BL
        
    ; PRINT NEW LINE 
    MOV AH, 2      ; AH = 2, DOS function to print a single character
    MOV DL, 0AH    ; ASCII for Line Feed (LF)
    INT 21H        ; Call DOS interrupt to print LF
    MOV DL, 0DH    ; ASCII for Carriage Return (CR)
    INT 21H        ; Call DOS interrupt to print CR
    
    ; PRINT SECOND INPUT CHARACTER
    MOV AH, 2      ; AH = 2, DOS function to print a single character  
    MOV DL, BL     ; Load the second input character (stored in BL) into DL
    INT 21H        ; Call DOS interrupt to display character
    
    ; PRINT NEW LINE
    MOV AH, 2      ; AH = 2, DOS function to print a single character
    MOV DL, 0AH    ; ASCII for Line Feed (LF)
    INT 21H        ; Call DOS interrupt to print LF
    MOV DL, 0DH    ; ASCII for Carriage Return (CR)
    INT 21H        ; Call DOS interrupt to print CR
    
    ; ADDITION 
    ADD BL, BH     ; Add first input (BH) and second input (BL), result stored in BL
    SUB BL, 30H    ; Convert ASCII to number (since ASCII digits start from '0' = 30H)
    MOV DL, BL     ; Load the result into DL for display
    INT 21H        ; Call DOS interrupt to display the addition result
    
    ; PRINT NEW LINE
    MOV AH, 2      ; AH = 2, DOS function to print a single character
    MOV DL, 0AH    ; ASCII for Line Feed (LF)
    INT 21H        ; Call DOS interrupt to print LF
    MOV DL, 0DH    ; ASCII for Carriage Return (CR)
    INT 21H        ; Call DOS interrupt to print CR  
            
    ; SUBTRACTION      
    SUB BL, BH     ; Subtract first input (BH) from BL (which holds the sum)
    ADD BL, 30H    ; Convert number back to ASCII for display
    MOV DL, BL     ; Load the result into DL for display
    INT 21H        ; Call DOS interrupt to display the subtraction result

    ; EXIT PROGRAM
    MOV AH, 4CH    ; AH = 4Ch, DOS function to terminate the program
    INT 21H        ; Call DOS interrupt to terminate the program
    
MAIN ENDP

END
