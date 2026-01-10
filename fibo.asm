DATA SEGMENT
    FIB DB 15 DUP(?)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    
    MOV FIB[0], 0
    MOV FIB[1], 1

    MOV CX, 13          ; Remaining 13
    MOV SI, 2           ; Index 

NEXT_FIB:
    MOV AL, FIB[SI-1]   
    MOV BL, FIB[SI-2]   
    ADD AL, BL          
    MOV FIB[SI], AL     

    INC SI
    LOOP NEXT_FIB       

    ; End program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
