DATA SEGMENT
    C DW 5
    D DW 6
    Y DW ?
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    
START:
    MOV AX, DATA
    MOV DS, AX
    MOV AX, C       
    MOV BX, 5       
    IMUL BX         

    CWD             
    IDIV D          
   
    MOV CX, AX  
   
    MOV AX, D 
    MOV BX, 6 
    IMUL BX 
  
    ADD CX, AX 
   
    MOV AX, C
    MOV BX, 7
    IMUL BX 
    
    SUB CX, AX
    
    MOV Y, CX ;05
    
    MOV AH, 4CH
    INT 21H
    
CODE ENDS
END START
