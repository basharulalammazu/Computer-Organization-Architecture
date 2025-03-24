.MODEL SMALL    ; Define the memory model as SMALL (Code and Data in separate segments)
.STACK 100H     ; Allocate 256 bytes (100H) of stack space

.DATA
    MSG DB "Hello World! $ "  ; Print Message

.CODE
    MAIN PROC
        MOV AX, @DATA  ; Load the address of the data segment into AX
        MOV DS, AX     ; Move AX (data segment address) into DS to access variables
        
        MOV AH, 9      ; AH = 9, ONLY FOR STRING OUTPUT 
        LEA DX, MSG    ; Load the effective address of MSG2 into DX
        INT 21H        ; Call DOS interrupt to display MSG
        
        ; EXIT PROGRAM
        MOV AH, 4CH    ; AH = 4Ch, DOS function to terminate the program
        INT 21H        ; Call DOS interrupt to terminate the program
    MAIN ENDP
END