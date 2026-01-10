data segment
    count dw 10
    space db ' $'
data ends

code segment
assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax
                ; first two numbers
    mov ax, 0
    call print_num
    mov ax, 1
    call print_num

    mov cx, count       ; loop count
    mov si, 0           ; a = 0
    mov di, 1           ; b = 1

fib_loop:
    mov ax, si
    add ax, di          ; ax = a + b
    call print_num

    mov si, di          ; a = b
    mov di, ax          ; b = c
    loop fib_loop

exit: hlt

print_num proc
    push ax
    push bx
    push cx
    push dx

    cmp ax, 0
    jne convert
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp space_print

convert:
    mov bx, 10
    mov cx, 0

conv_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne conv_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop

space_print:
    lea dx, space
    mov ah, 09h
    int 21h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num endp

code ends
end start
