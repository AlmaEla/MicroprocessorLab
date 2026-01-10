DATA SEGMENT
    AB DW 100       ; AB = 100 (DEC) = 64H
    AC DW 120       ; AC = 120 (DEC) = 78H
    BD DW 80        ; BD = 80 (DEC) = 50H
    AD DW ?         ; AD = sqrt(TEMP) = 60 (DEC) = 3CH (????)
    TEMP DW ?       ; TEMP = AB^2 - BD^2 = 10000-6400=3600 (DEC) = 0E10H
    CE DW ?         ; CE = AC - AD = 120-60=60 (DEC) = 3CH
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    MOV AX, AB
    MOV BX, AX
    IMUL BX            ; AX = AB^2 = 100^2 = 10000 DEC = 2710H
    MOV TEMP, AX       ; TEMP = 2710H (HEX) = 10000 DEC

    MOV AX, BD
    MOV BX, AX
    IMUL BX            ; AX = BD^2 = 80^2 = 6400 DEC = 1900H
    SUB TEMP, AX       ; TEMP = 10000-6400=3600 DEC = 0E10H

    MOV CX, 0
SQRT_LOOP:
    INC CX
    MOV AX, CX
    MOV BX, CX
    IMUL BX            ; AX = CX^2, loop ???? ?????? AX <= TEMP
    CMP AX, TEMP
    JG SQRT_DONE
    JMP SQRT_LOOP
SQRT_DONE:
    DEC CX
    MOV AD, CX         ; AD = 60 DEC = 3CH HEX

    MOV AX, AC
    SUB AX, AD
    MOV CE, AX         ; CE = 120-60=60 DEC = 3CH HEX

    HLT

CODE ENDS
END START
