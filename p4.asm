assume cs:code
code segment
    mov ax,0ffffh
    mov ds,ax
    mov dx,0

    mov cx,bh

 s: mov al,ds:[cx]
    mov ah,0
    add dx,ax
    loop s
code ends
end