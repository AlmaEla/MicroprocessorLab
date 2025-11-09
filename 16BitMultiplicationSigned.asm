DATA SEGMENT
    NUM DW -2,1
    PROD DW 2DUP(0)
    DATA ENDS
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
    START:MOV AX,DATA
    MOV DS,AX
    LEA SI,NUM
    MOV AX,[SI]
    MOV BX,[SI+2]
    IMUL BX
    MOV PROD,AX
    MOV PROD+2,DX
    MOV AH,4CH
    INT 21H
    CODE ENDS
END START;INPUT: Multiplicand- -2, Multiplier - 1 OUTPUT: DX - FF FF AX - FF FE  Result is in two complement form. 

