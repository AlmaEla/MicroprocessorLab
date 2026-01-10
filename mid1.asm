DATA SEGMENT
    NUM1 DW 04H
    NUM2 DW 02H
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    MOV CX, NUM1      ; Load first number into CX
    MOV DX, NUM2      ; Load second number into DX

    ADD CX, DX        ; Add CX + DX

    MOV DI, 0500H
    MOV AX, CX
    MOV [DI], AX      ; Store result at memory location 0500H

    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
