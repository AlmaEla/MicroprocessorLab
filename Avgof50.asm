DATA SEGMENT
    AVG DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    MOV CX, 50      ; loop counter (1 to 50)
    MOV AX, 0       ; AX = sum
    MOV BL, 1       ; number starts from 1

SUM_LOOP:
    ADD AX, BX      ; AX = AX + BX
    INC BL          ; next number
    LOOP SUM_LOOP

    MOV BL, 50      ; divisor
    DIV BL          ; AX / 50

    MOV AVG, AL     ; store average (integer part)

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
